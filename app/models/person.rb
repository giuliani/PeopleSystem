require 'uri'

class Person < ActiveRecord::Base

  validates :first_name, presence: true, length: { maximum: 75 }
  validates :last_name, presence: true, length: { maximum: 75 }
  validates :birthdate, presence: true
  validates :email, presence: true, length: { maximum: 254 }, uniqueness: { case_sensitive: false }
  # valid email contains word chars, # - ~ ! $ & ' ( ) * + , ; = : . and percentile encoding i.e. %20
  # followed by one @, more than one word char and one . with more than one word character
  validates_format_of :email, :with => /\A([\w#(%\h{2})\(\)\*\+\.,;=:'&$!~-])+@{1}\w+.{1}\w+\Z/, :on => :create
  validates_inclusion_of :gender, :in => %w( m f u ), allow_blank: true
  validate :birthdate_after_today
  validates_format_of :picture, :with => URI.regexp, allow_blank: true

  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_gender_name
    return "" unless !gender.nil?
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
      !birthdate.blank? and birthdate > Date.today
  end

end
