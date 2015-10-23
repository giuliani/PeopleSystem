require 'uri'

class Person < ActiveRecord::Base

  validates :first_name, presence: true, length: { maximum: 75 }
  validates :last_name, presence: true, length: { maximum: 75 }
  validates :birthdate, presence: true
  validates :email, presence: true, length: { maximum: 254 }, uniqueness: { case_sensitive: false }
  # valid email contains word chars, # - ~ ! $ & ' ( ) * + , ; = : and percentile encoding i.e. %20
  # followed by one @, more than one word char and one . with more than one word character
  validates_format_of :email, :with => /\A([\w#(%\h{2})\(\)\*\+,;=:'&$!~-])+@{1}\w+.{1}\w+\Z/, :on => :create
  validates_inclusion_of :gender, :in => %w( m f u )
  validate :birthdate_after_today
  validates_format_of :picture, :with => URI.regexp

  def birthdate_after_today
    errors.add(:birthdate, "can't be in the future") if
      !birthdate.blank? and birthdate > Date.today
  end

end
