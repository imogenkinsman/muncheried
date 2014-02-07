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

    doc = Nokogiri::HTML(open("https://munchery.com/menus/#/0"))
    content = doc.at_xpath("//script[@class='menu-page-data']")
    json = JSON.parse(content.inner_html.strip)

    %w(Entree Side).each do |type|
      scrape(json, type)
    end

  end

  def scrape(json, category)
    items = json['menu']['sections'].find { |section| section["name"] == category.pluralize }["items"]
    flash_items = items.select { |entree| entree["price_mod"] == "Flash Sale" }

    new_records = false

    flash_items.each do |entree|
      meal = Meal.find_or_initialize_by(name: entree['name'])
      new_records = true if meal.new_record?
      price = BigDecimal('%d.%.2d' % [entree['price']['dollars'], entree['price']['cents']])
      meal.update(name: entree['name'], description: entree['description'], category: category,
                  url: ("https://munchery.com/menus/#/0/#{entree['url']}/info"), price: price,
                  remaining: entree['qty_remaining'])
    end

    if new_records
      User.where('emailed_at < ?', 1.day.ago).each do |user|
        MealMailer.alert_email(user)
      end
    end
  end

end