source 'https://rubygems.org'
ruby '2.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# for SMTP
gem 'mandrill-api', '~> 1.0.49'

# for web scraping
gem 'nokogiri', '~> 1.6.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'compass-rails', '~> 1.1.3'
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.0'

group :test do
  gem 'coveralls', require: false
  gem 'simplecov', :require => false
  gem 'rspec-rails'
  gem 'rake'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara', '~> 2.1'
end

group :production do
  gem 'rails_12factor' # for heroku
end
