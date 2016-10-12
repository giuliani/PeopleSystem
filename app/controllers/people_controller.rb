##
require 'rake'
require 'resque/tasks'

class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # Public: Retrieves a full list of all people in the system.
  #
  # Examples
  #
  #   GET /people.json
  #   # => { status: 200, people: [{ id: 1, full_name: 'John Smith', age: 84, url: '/people/1.json' }] }
  #
  # Returns the full list of people in the system
  def index
    @people = Person.all.order(:first_name, :last_name)
  end

  # Public: Retrieves all attributes of the specified person.
  #
  # id - the person's id.
  #
  # Examples
  #
  #   GET /people/1.json
  #   # => { status: 200, person: { id: 1, first_name: 'John', last_name: 'Smith', email: 'john.smith@example.com', job: 'taxi driver', bio: 'My Bio.', gender: 'm', birthdate: '1980/02/08', picture: 'http://images.com/1.jpg', created_at: '2015-01-01 13:51:03', updated_at: '2015-01-01 13:51:03' } }
  #
  # Returns all attributes for the person
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    render :new
  end

  # GET /people/1/edit
  def edit
  end

  # Public: Creates a new person with the attributes provided.
  #
  # person - A hash containing all the attributes to create the new person.
  #
  # Examples
  #
  #   POST /people.json correct_person_hash
  #   # => { status: 201, person_object }
  #
  #   POST /people.json incorrect_person_hash
  #   # => { status: 422, errors: {'email': ['Email is invalid']} }
  #
  # Returns redirect to person url or displays errors upon attempting creation.
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Updates a person with the attributes provided.
  #
  # person - A hash containing all the attributes to update the specified person.
  #
  # Examples
  #
  #   PUT /people.json correct_person_hash
  #   # => { status: 200, person_object }
  #
  #   PUT /people.json incorrect_person_hash
  #   # => { status: 422, errors: {'email': ['Email is invalid']} }
  #
  # Returns redirect to person url or displays errors upon attempting the update.
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Deletes the person with the specified id.
  #
  # id - the person's id.
  #
  # Examples
  #
  #   DELETE /people/1.json
  #   # => { status: 200, message: 'Person was successfully destroyed.' }
  #
  # Returns redirect to people url with the message.
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
    end
end
