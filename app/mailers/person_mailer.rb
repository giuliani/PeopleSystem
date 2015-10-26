class PersonMailer < ActionMailer::Base
  default from: PeopleSystem::Application.config.from_email

  # Internal: Sets the created person email.
  #
  # recipient - the Person object that will receive the email
  # person - the Person object that is the subject of creation.
  #
  # Examples
  #
  #   PersonMailer.created_person_email(recipient, person).deliver
  #   # => the email in app/views/person_mailer/created_person_email.html.erb
  #
  # Returns nothing. Sends out the email
  def created_person_email(recipient, person)
    @person = person
    @recipient = recipient
    mail(to: recipient.email, subject: 'People App - New person added')
  end

  # Internal: Sets the deleted person email.
  #
  # recipient - the Person object that will receive the email
  # person - the person hash containing the person info that is the subject of deletion.
  #
  # Examples
  #
  #   PersonMailer.created_person_email(recipient, person).deliver
  #   # => the email in app/views/person_mailer/deleted_person_email.html.erb
  #
  # Returns nothing. Sends out the email
  def deleted_person_email(recipient, person)
    @person = person
    @recipient = recipient
    mail(to: recipient.email, subject: 'People App - A person has been deleted')
  end
end

