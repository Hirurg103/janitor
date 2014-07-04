require 'database_cleaner'

DatabaseCleaner::strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end
