ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  include FactoryGirl::Syntax::Methods
  # Add more helper methods to be used by all tests here...
end

# Minitest
class Minitest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionController::TestCase::Behavior
end

# Minitest::Spec
class Minitest::Spec
  include FactoryGirl::Syntax::Methods
end

# minitest-rails
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

(ActiveRecord::Base.connection.tables - %w{schema_migrations}).each do |table_name|
  ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{table_name};"
end
