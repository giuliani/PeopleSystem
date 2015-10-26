require 'test_helper'
require 'minitest/rails'

class PeopleControllerTest < MiniTest::Unit::TestCase
  def setup
    @person = create(:person)
    @routes = Rails.application.routes
  end
  
  def test_get_index
    get :index
    assert_response :success
    refute_nil assigns(:people)
  end

  def test_get_new
    get :new
    assert_response :success
  end

  def test_create_person
    current_count = Person.count
    another_person = build(:person).attributes
    another_person.delete("id")
    post :create, person: another_person
    diff(current_count+1, Person.count)

    assert_redirected_to person_path(assigns(:person))
  end

  def test_show_person
    get :show, id: @person
    assert_response :success
  end

  def test_get_edit
    get :edit, id: @person
    assert_response :success
  end

  def test_update_person
    patch :update, id: @person, person: { bio: @person.bio, birthdate: @person.birthdate, email: @person.email, first_name: @person.first_name, gender: @person.gender, job: @person.job, last_name: @person.last_name, picture: @person.picture }
    assert_redirected_to person_path(assigns(:person))
  end

  def test_destroy_person
    diff('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_response :success
  end
end
