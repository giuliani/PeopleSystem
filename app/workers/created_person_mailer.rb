class CreatedPersonMailer
  @queue = :person_created_queue

  def self.perform person_id
    person = Person.find(person_id)
    PersonMailer.created_person_email(person).deliver
  end
end
