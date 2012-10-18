module Restulicious
  module Parser
    class Default

      def initialize(klazz, key, body)
        @klazz = klazz
        @key   = key
        @body  = body
      end

      def result
        if collection?
          set_collection
          hashified_body
        else
          @klazz.from_api(hashified_body.symbolize_keys!)
        end
      end

      private

      def hashified_body
        @hashified_body ||= JSON.parse(@body)
      end

      def collection?
        hashified_body[@key].is_a?(Array)
      end

      def struct
        @struct ||= OpenStruct.new
      end

      def set_collection
        collection = []
        hashified_body.delete(@key).each do |object_attributes|
          collection << @klazz.from_api(object_attributes.symbolize_keys!)
        end
        hashified_body[@key] = collection
      end

    end
  end
end
