module Restulicious
  module Parser
    class Default

      def initialize(klazz, collection_key, body)
        @klazz          = klazz
        @collection_key = collection_key
        @body           = body
      end

      def result
        if collection?
          if @collection_key == "none"
            collection = []
            hashified_body.each do |object_attributes|
              collection << @klazz.from_api(object_attributes.symbolize_keys!)
            end
            collection
          else
            Restulicious::Collection.from_parser(@klazz, @collection_key, hashified_body)
          end
        else
          @klazz.from_api(hashified_body.symbolize_keys!)
        end
      end

      private

      def hashified_body
        @hashified_body ||= JSON.parse(@body)
      end

      def collection?
        if @collection_key == "none"
          hashified_body.is_a?(Array)
        else
          hashified_body[@collection_key].is_a?(Array)
        end
      end

    end
  end
end
