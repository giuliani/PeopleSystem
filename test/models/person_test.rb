require 'test_helper'
require 'minitest/rails'

class PersonTest < MiniTest::Unit::TestCase
  def setup
    @person = build(:person)
    @routes = Rails.application.routes
  end

  def test_not_valid_without_necessary_fields
    person = Person.create
    refute_equal true, person.valid?
  end

  def test_email_regex
    person = Person.create({ 'first_name': 'Another', 'last_name': 'User', 'email': 'fake_email',
                              'birthdate': '1939/01/01' })
    refute_equal true, person.valid?
    assert_includes person.errors.full_messages, "Email is invalid"
  end

  def test_birthdate_after_today
    person = Person.create({ 'first_name': 'Another', 'last_name': 'User',
                             'email': 'some_email@example.com', 'birthdate': '2017/01/01' })
    refute_equal true, person.valid?
    assert_includes person.errors.full_messages, "Birthdate can't be in the future"
  end

  def test_full_gender_name
    assert_equal 'not specified', @person.full_gender_name
  end

  def test_full_gender_name
    assert_equal 'not specified', @person.full_gender_name
  end

  def test_person_full_name
    assert_equal 'Test User', @person.full_name
  end

  def test_gender_in_allowed_values
    person = Person.create({ 'first_name': 'Another', 'last_name': 'User', 'email': 'my_email@example.com',
                              'birthdate': '1989/04/08', 'gender': 'g' })
    refute_equal true, person.valid?
    assert_includes person.errors.full_messages, "Gender is not included in the list"
  end

  def test_pic_url_regex
    person = Person.create({ 'first_name': 'Another', 'last_name': 'User', 'email': 'my_email@example.com',
                              'birthdate': '1989/04/08', 'picture': 'a picture' })
    refute_equal true, person.valid?
    assert_includes person.errors.full_messages, "Picture is invalid"
  end
end
