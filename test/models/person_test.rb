require 'test_helper'
require 'minitest/rails'

class PersonTest < MiniTest::Unit::TestCase
  def setup
    @person = create(:person)
    @routes = Rails.application.routes
  end

  def test_name
    assert_equal "Test", @person.first_name
  end
end
