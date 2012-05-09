module RestResource
  module Attributes
    extend ::ActiveSupport::Concern

    module ClassMethods

      def attributes(*attribute_names)
        @attribute_names = attribute_names
        attr_accessor *attribute_names
      end

      def attribute_names
        @attributes
      end

    end

  end
end
