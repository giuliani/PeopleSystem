##
require 'uri'

class Person < ActiveRecord::Base

  validates :first_name, presence: true, length: { maximum: 75 }
  validates :last_name, presence: true, length: { maximum: 75 }
  validates :birthdate, presence: true
  validates :email, presence: true, length: { maximum: 254 }, uniqueness: { case_sensitive: false }
  # valid email contains word chars, # - ~ ! $ & ' ( ) * + , ; = : . and percentile encoding i.e. %20
  # followed by one @, more than one word char and one . with more than one word character
  validates_format_of :email, :with => /\A([\w#(%\h{2})\(\)\*\+\.,;=:'&$!~-])+@{1}\w+.{1}\w+\Z/
  validates_inclusion_of :gender, :in => %w( m f u ), allow_blank: true
  validate :birthdate_after_today
  validates_format_of :picture, :with => URI.regexp, allow_blank: true

  has_many :people_roles
  has_many :roles, through: :people_roles

  # Internal: Calculates the person's age based on birthdate.
  #
  # Examples
  #
  #   person.age
  #   # => 24
  #
  # Returns the person's age.
  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  # Internal: Concatenates person's first_name and last_name.
  #
  # Examples
  #
  #   person.full_name
  #   # => John Smith
  #
  # Returns the person's full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Internal: Sets a distinct gender based on the person's gender set option.
  #
  # Examples
  #
  #   person.full_gender_name
  #   # => male
  #   person.full_gender_name
  #   # => female
  #   person.full_gender_name
  #   # => not specified
  #
  # Returns the gender full name based on what is set.
  def full_gender_name
    return "" if gender.nil?
    case gender 
      when "m"
        return "male"
      when "f"
        return "female"
      when "u"
        return "not specified"
      when ""
        return "N/A"
    end
  end

  private

  def birthdate_after_today
    errors.add(:birthdate, "can't be in the future") if
      birthdate.present? and birthdate > Date.today
  end

end
