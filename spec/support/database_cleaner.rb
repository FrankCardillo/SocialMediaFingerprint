RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
