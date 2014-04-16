source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.1'

gem 'rails', '4.0.3'

# APIs
gem 'bugsnag'

# Auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'

group :production, :staging do
  gem 'pg'
end

group :development do
  # Debugs
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'quiet_assets'
  gem 'tapp'
  gem 'view_source_map'
  gem 'i18n-tasks'
  gem 'thin'
  gem 'coffee-rails-source-maps'
end

group :test, :development do
  # TDD
  gem 'brakeman'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'delorean'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-sprockets2'
  gem 'json_expressions'
  gem 'launchy'
  gem 'nokogiri'
  gem 'poltergeist'
  gem 'rails-db-resetup'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails',   '~> 4.0.0'
gem 'jquery-rails'
gem 'haml-rails'
gem 'erb2haml'
gem 'font-awesome-rails'
gem 'figaro'
gem 'unicorn'
gem 'backbone-on-rails'
gem 'haml_coffee_assets'
gem 'therubyracer', platforms: :ruby

gem 'jbuilder', '~> 1.2'
gem 'rails-assets-backbone.marionette'
gem 'rails-assets-backbone.stickit'
gem 'rails-assets-moment'

