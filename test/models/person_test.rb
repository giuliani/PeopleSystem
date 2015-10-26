require 'test_helper'
require 'minitest/rails'

class PersonTest < MiniTest::Unit::TestCase
  def setup
    @person = create(:person)
  end

  def test_name
    assert_equal "Test", @person.first_name
  end
end
