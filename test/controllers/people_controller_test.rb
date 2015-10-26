require 'test_helper'
require 'minitest/rails'

class PeopleControllerTest < MiniTest::Unit::TestCase
  def setup
    @person = create(:person)
  end

  def test_something
    assert_equal true, true
  end
end
