class DeletedPersonMailer
  @queue = :person_deleted_queue

  # Internal: The worker's actions to perform. When the job executes, it calls the PersonMailer
  #           function to send out the corresponding email.
  #
  # queue_hash - the hash containing the created person's information hash and the recipient_id
  #
  # Examples
  #
  #   DeletedPersonMailer.perform
  #
  # Returns nothing. Calls the PersonMailer to send out emails.
  def self.perform queue_hash
    puts "Preparing to send Person Deleted Email."
    recipient = Person.find queue_hash['recipient_id']
    PersonMailer.deleted_person_email(recipient, queue_hash['person']).deliver
  end
end
