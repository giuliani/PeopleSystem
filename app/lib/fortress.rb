module Fortress
  module Fortifiable

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def fencable
        has_many :permissions, as: :fortifiable

        include Fortress::Fortifiable::InstanceMethods
      end
    end

    module InstanceMethods
      def is_allowed_to?(*args)
        true
      end
    end

  end
end
