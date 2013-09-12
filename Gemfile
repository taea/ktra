source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'

  # Rspec
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'delorean'
  gem 'shoulda-matchers'

  # Capybara
  gem 'capybara'
  gem 'poltergeist'
  gem 'launchy'

  # Testing tools
  gem 'database_cleaner'
  gem 'webmock', require: false
  
  # Guard
  gem 'spork'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-rails-assets'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails',   '~> 3.2.3'
gem 'jquery-rails'
gem 'haml-rails'
gem 'erb2haml'
gem 'font-awesome-rails'
gem 'figaro'
gem 'omniauth'
gem 'omniauth-twitter'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
