module RestResource
  class Parser

    def initialize(klazz, body)
      @klazz = klazz
      @body = body
    end

    def objects
      objects = []
      hashified_body[key].each do |object_attributes|
        objects << @klazz.from_api(object_attributes.symbolize_keys!)
      end
      objects
    end

    private

    def key
      @klazz.to_s.downcase.pluralize
    end

    def hashified_body
      JSON.parse(@body)
    end

  end
end
