
ENV['RACK_ENV'] = 'test'

require 'web_helper'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'database_cleaner'
require_relative '../app/app'
require_relative '../app/datamapper_setup'

Capybara.app = Makersbnb

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
