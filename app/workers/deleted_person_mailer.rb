class DeletedPersonMailer
  @queue = :person_deleted_queue

  def self.perform person
    PersonMailer.deleted_person_email(person).deliver_now!
  end
end
