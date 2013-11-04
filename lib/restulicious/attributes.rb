module Restulicious
  module Attributes
    extend ::ActiveSupport::Concern

    module ClassMethods

      def attributes(*attribute_names)
        @attribute_names = attribute_names
        attr_accessor *attribute_names
      end

      def attribute_names
        @attribute_names
      end

    end

    def initialize(attributes = {})
      attributes.each do |key, value|
        send("#{key}=", check_utf8(value)) if respond_to?("#{key}=")
      end
      super
    end

    private

    def check_utf8(x)
      return x unless x.is_a?(String)
      return x if x.ascii_only?
      enc_name = x.encoding.name
      enc_valid = x.valid_encoding?
      return x if enc_name == "UTF-8" && enc_valid
      begin
        puts "ENCODING #{enc_name} valid=#{enc_valid} for #{x}"
      rescue Exception
        puts "could not print attribute value"
      end
      x
    end

  end
end
