class CreatedPersonMailer
  @queue = :person_created_queue

  def self.perform queue_hash
    puts "Preparing to send New Person Created Email."
    person = Person.find queue_hash['person_id']
    recipient = Person.find queue_hash['recipient_id']
    PersonMailer.created_person_email(recipient, person).deliver
  end
end
