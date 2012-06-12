module RestResource
  class Parser

    def initialize(klazz, body)
      @klazz = klazz
      @body = body
    end

    def objects
      objects = []
      if collection?
        hashified_body[key].each do |object_attributes|
          objects << @klazz.from_api(object_attributes.symbolize_keys!)
        end
      else
        objects << @klazz.from_api(hashified_body.symbolize_keys!)
      end
      objects
    end

    private

    def key
      @klazz.to_s.downcase.pluralize
    end

    def hashified_body
      @hashified_body ||= JSON.parse(@body)
    end

    def collection?
      hashified_body[key].is_a?(Array)
    end

  end
end
