class PersonMailer < ActionMailer::Base
  default from: PeopleSystem::Application.config.from_email

  def created_person_email(recipient, person)
    @person = person
    @recipient = recipient
    mail(to: recipient.email, subject: 'People App - New person added')
  end

  def deleted_person_email(recipient, person)
    @person = person
    @recipient = recipient
    mail(to: recipient.email, subject: 'People App - A person has been deleted')
  end
end

