class Role < ActiveRecord::Base

  include Fortress::Fortifiable

  validates :name, presence: true, uniqueness: true

  has_many :people_roles
  has_many :roles, through: :people_roles

end
