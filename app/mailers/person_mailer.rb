class PersonMailer < ActionMailer::Base
  default from: PeopleSystem::Application.config.from_email

  def created_person_email(person)
    @person = person
    recipients = Person.where.not(id: person.id)
    recipients.each do |recipient|
      @recipient = recipient
      mail(to: recipient.email, subject: 'People App - New person added')
    end
  end

  def deleted_person_email(person)
    @person = person
    recipients = Person.all
    recipients.each do |recipient|
      @recipient = recipient
      mail(to: recipient.email, subject: 'People App - A person has been deleted')
    end
  end
end
