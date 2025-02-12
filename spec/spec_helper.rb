ENV["RACK_ENV"] = "test"
ENV["ENVIRONMENT"] = "test"
require 'simplecov'
require 'simplecov-console'
require "capybara"
require "capybara/rspec"
require "rspec"
require "date"
require 'orderly'

require_relative "../lib/database_connection"
require_relative "./setup_test_db"
require_relative "../app"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = ChitterApp

RSpec.configure do |config|
  config.before(:each) do
    setup_test_db
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
