require 'minitest/autorun'

class PersonTest < Minitest::Unit::TestCase

  def setup
    #TODO investigate errors using FactoryGirl.create, ArgumentError: Factory not registered: person
    #and just create throws NoMethodError: undefined method `create' for #<PersonTest:...
    @person = create(:person)
  end

  def test_factory_data
    assert_equal "Test", @person.first_name
  end

end
