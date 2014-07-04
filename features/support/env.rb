require 'capybara'
require 'cucumber/rails'

Capybara::configure do |config|
  config.default_driver = :selenium
end

World(Capybara::DSL)
