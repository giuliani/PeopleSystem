class DeletedPersonMailer
  @queue = :person_deleted_queue

  def self.perform queue_hash
    puts "Preparing to send Person Deleted Email."
    recipient = Person.find queue_hash['recipient_id']
    PersonMailer.deleted_person_email(recipient, queue_hash['person']).deliver
  end
end
