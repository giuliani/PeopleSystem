require 'minitest/autorun'

class PeopleControllerTest < Minitest::Test
  def setup
    @person = create(:person)
  end

  def should_get_index
  get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  def should_get_new
    get :new
    assert_response :success
  end

  def should_create_person
    @person.email = "different@email.com"
    assert_difference('Person.count') do
      post :create, person: { bio: @person.bio, birthdate: @person.birthdate, email: @person.email, first_name: @person.first_name, gender: @person.gender, job: @person.job, last_name: @person.last_name, picture: @person.picture }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  def should_show_person
    get :show, id: @person
    assert_response :success
  end

  def should_get_edit
    get :edit, id: @person
    assert_response :success
  end

  def should_update_person
    patch :update, id: @person, person: { bio: @person.bio, birthdate: @person.birthdate, email: @person.email, first_name: @person.first_name, gender: @person.gender, job: @person.job, last_name: @person.last_name, picture: @person.picture }
    assert_redirected_to person_path(assigns(:person))
  end

  def should_destroy_person
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
