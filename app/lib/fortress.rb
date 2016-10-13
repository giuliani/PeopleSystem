module Fortress
  module Fortifiable

    def self.included(base)
      base.extend ClassMethods
    end
    
    def is_allowed_to?(*args)
      false
    end

    module ClassMethods
      def fencable
        has_many :permissions, as: :fortifiable

        include Fortress::Fortifiable::InstanceMethods
      end
    end

  end
end

