ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'json_expressions/rspec'

# Load all railties files
Rails.application.railties.to_a { |r| r.eager_load! }

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # For capybara
  require 'capybara/rspec'
  require 'capybara/poltergeist'
  Capybara.register_driver :rack_test do |app|
      Capybara::RackTest::Driver.new(app, headers: {'HTTP_ACCEPT_LANGUAGE' => 'ja-JP'})
  end
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, timeout: 360, headers: {'HTTP_ACCEPT_LANGUAGE' => 'ja-JP'})
  end
  Capybara.javascript_driver = :poltergeist

  # For database cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do |example|
    if example.metadata[:js]
      page.driver.resize(1024, 2048)
    end
    I18n.locale = (ENV['CI'] == 'ON') ? :en : :ja
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do |example|
    DatabaseCleaner.clean
    if example.metadata[:js]
      load "#{Rails.root}/db/seeds.rb"
    end
  end

  # macro
  config.include FeatureMacros, type: :feature
  config.include FactoryGirl::Syntax::Methods
  config.include Delorean

  # metadata setting
  #config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:all) do
    FactoryGirl.reload
  end

  # faker
  Faker::Config.locale = :en

  # master data
  #load "#{Rails.root}/db/seeds.rb"
end
