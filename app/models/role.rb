class Role < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :people_roles
  has_many :roles, through: :people_roles

end