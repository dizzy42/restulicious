module Restulicious
  class Parser

    def initialize(klazz, key, body)
      @klazz = klazz
      @key   = key
      @body  = body
    end

    def objects
      objects = []
      if collection?
        hashified_body[@key].each do |object_attributes|
          objects << @klazz.from_api(object_attributes.symbolize_keys!)
        end
      else
        objects << @klazz.from_api(hashified_body.symbolize_keys!)
      end
      objects
    end

    private

    def hashified_body
      @hashified_body ||= JSON.parse(@body)
    end

    def collection?
      hashified_body[@key].is_a?(Array)
    end

  end
end
