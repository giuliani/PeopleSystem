class Bastion < ActiveRecord::Base

  belongs_to :fortifiable, polymorphic: true
  belongs_to :permission

end