require 'minitest/autorun'

class PersonTest < Minitest::Unit::TestCase

  def setup
    @person = FactoryGirl.build(:person)
  end

  def test_factory_data
    assert_equal "Test", @person.first_name
  end

end
