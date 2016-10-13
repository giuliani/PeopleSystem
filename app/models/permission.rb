class Permission < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  belongs_to :fortifiable, polymorphic: true

end