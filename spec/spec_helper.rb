require 'rubygems'
require 'spork'
require 'spork/ext/ruby-debug'

Spork.prefork do
  require "rails/application"
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  #require 'rspec/autorun'
  #
  require 'factory_girl_rails'

  require 'database_cleaner'
  DatabaseCleaner.clean_with :truncation
  DatabaseCleaner.strategy = :transaction

  RSpec.configure do |config|
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # No need to run these, keeping around in case future need
  # Dir[Rails.root.join("app/models/**.rb")].each {|f| require f}
  # Dir[Rails.root.join("spec/factories/**.rb")].each {|f| require f}
end
