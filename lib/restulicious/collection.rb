module Restulicious
  class Collection

    def initialize(attributes)
      @attributes = attributes
    end

    def total
      @attributes[:total]
    end

    def objects
      @attributes[:objects]
    end

    def to_json
      {
        :total                  => total,
        "#{objects_key}".to_sym => objects
      }
    end

    private

    def objects_key
      @attributes[:objects_key]
    end

  end
end
