require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

desc "deletes old content and scrapes new content from Munchery"
task :scrape => :environment do

  Meal.delete_all(["updated_at < ?", 12.hours.ago])

  base_url = "https://munchery.com/menus/#/0"

  doc = Nokogiri::HTML(open(base_url))
  content = doc.at_xpath("//script[@class='menu-page-data']")
  json = JSON.parse(content.inner_html.strip)
  entrees = json['menu']['sections'].find { |section| section["name"] == "Entrees" }["items"]
  flash_entrees = entrees.select { |entree| entree["price_mod"] == "Flash Sale" }

  flash_entrees.each do |entree|
    meal = Meal.find_or_initialize_by(name: entree['name'])

    price = BigDecimal('%d.%.2d' % [entree['price']['dollars'], entree['price']['cents']])
    meal.update(name: entree['name'], description: entree['description'], category: "entree",
        url: ("#{base_url}/#{entree['url']}/info"), price: price, remaining: entree['qty_remaining'])
  end

  #TODO: DRY THIS!
  sides = json['menu']['sections'].find { |section| section["name"] == "Sides" }["items"]
  flash_sides = entrees.select { |entree| entree["price_mod"] == "Flash Sale" }

  flash_sides.each do |side|
    meal = Meal.find_or_initialize_by(name: side['name'])

    price = BigDecimal('%d.%.2d' % [side['price']['dollars'], side['price']['cents']])
    meal.update(name: side['name'], description: side['description'], category: "side",
                url: ("#{base_url}/#{side['url']}/info"), price: price, remaining: side['qty_remaining'])
  end

end
