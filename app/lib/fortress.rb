module Fortress
  module Fortifiable

    def self.included(base)
      base.extend ClassMethods
    end
    
    def is_allowed_to?(*args)
      return true if resolve_implications(args)
      args = args.map(&:to_s)
      return true if self.permissions.where("name in (?)", args).any?
      allowed_to_in_relationships? args
    end
    
    def method_missing(method_name, *args)
      if method_name.to_s.match/(\w+)_implies/
        self.class.class_eval do
          define_method(method_name) do
            []
          end
        end
        send(method_name)
      else
        super
      end
    end
    
    def allowed_to_in_relationships?(args)
      # Collect all of the has_many and belongs_to relationships
      # for the object to iterate over them and look for
      # the permission there
      associations = self.class.reflect_on_all_associations(:has_many).map(&:name)
      associations += self.class.reflect_on_all_associations(:belongs_to).map(&:name)
      associations -= self.class.reject_permissions_from if self.class.reject_permissions_from
      
      associations.each do |assoc|
        assoc_permissions = self.send(assoc).permissions rescue nil
        if assoc_permissions && assoc_permissions.any?
          assoc_permissions.where("name in (?)", args).any?
        end
      end
    end
    
    def resolve_implications
      # Add permission names that are implied by
      # each of the permissions passed in
      if args.include?(:all) return true
      args.each do |arg|
        args << self.send(arg.to_s + "_implies")
      end
      false
    end

    module ClassMethods
      def fencable
        has_many :permissions, as: :fortifiable
      end
    end

  end
end

