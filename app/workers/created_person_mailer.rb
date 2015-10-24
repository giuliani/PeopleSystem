class CreatedPersonMailer
  @queue = :person_created_queue

  def self.perform person_id
    person = Person.find(person_id)
    people = People.all
    
  end
end
