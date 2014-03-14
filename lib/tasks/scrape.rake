require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

namespace :scrape do

  desc "deletes old content"
  task :clean => :environment do
    Meal.delete_all(["updated_at < ?", 12.hours.ago])
  end

  desc "scrapes new content from Munchery"
  task :run => :environment do
    # hacky heroku scheduler code here
    time = Time.now
    scrape unless time.hour < 14 || time.hour > 18
  end

  def scrape
    doc = Nokogiri::HTML(open("https://munchery.com/menus/#/0"))
    content = doc.at_xpath("//script[@class='menu-page-data']")
    json = JSON.parse(content.inner_html.strip)

    current_meals = Meal.all.size

    %w(Entree Side Drink).each do |type|
      parse_content(json, type)
    end

    if Meal.all.size > current_meals && !Meal.available(category: 'Entree').empty?
      User.get_recipients.each do |user|
        MealMailer.alert_email(user).deliver
      end
    end
  end

  def parse_content(json, category)
    items = json['menu']['sections'].find { |section| section["name"] == category.pluralize }["items"]
    flash_items = items.select { |entree| entree["price_mod"] == "Flash Sale" }

    flash_items.each do |item|
      meal = Meal.find_or_initialize_by(name: item['name'])
      new_records = true if meal.new_record?
      price = BigDecimal('%d.%.2d' % [item['price']['dollars'], item['price']['cents']])
      meal.update(name: item['name'], description: item['description'], category: category,
                  url: ("https://munchery.com/menus/#/0/#{item['url']}/info"), price: price,
                  remaining: item['qty_remaining'])
    end
  end

end