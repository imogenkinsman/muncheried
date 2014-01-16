require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

desc "deletes old content and scrapes new content from Munchery"
task :scrape do

  Meal.delete_all("updated_at < ?", 12.hours.ago)

  base_url = "https://munchery.com/menus/#/0"

  doc = Nokogiri::HTML(open(base_url))
  content = doc.at_xpath("//script[@class='menu-page-data']")
  json = JSON.parse(content.inner_html.strip)
  entrees = json['menu']['sections'].find { |section| section["name"] == "Entrees" }["items"]
  flash_entrees = entrees.select { |entree| entree["price_mod"] == "Flash Sale" }

  flash_entrees.each do |entree|
    meal = Meal.find_or_initialize_by(name: entree['name'])

    price = BigDecimal('%d.%.2d' % [entree['price']['dollars'], entree['price']['cents']])
    meal.update(name: entree['name'], description: entree['description'], url: ("#{baseurl}/#{entree['url']}/info"),
                price: price, remaining: entree['qty_remaining'])
  end

end
