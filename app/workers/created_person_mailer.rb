class CreatedPersonMailer
  @queue = :person_created_queue

  # Internal: The worker's actions to perform. When the job executes, it calls the PersonMailer
  #           function to send out the corresponding email.
  #
  # queue_hash - the hash containing the created person's person_id and the recipient_id
  #
  # Examples
  #
  #   CreatedPersonMailer.perform
  #
  # Returns nothing. Calls the PersonMailer to send out emails.
  def self.perform queue_hash
    puts "Preparing to send New Person Created Email."
    person = Person.find queue_hash['person_id']
    recipient = Person.find queue_hash['recipient_id']
    PersonMailer.created_person_email(recipient, person).deliver
  end
end
