module Restulicious
  class Collection
    include Enumerable
    include Attributes

    attr_accessor :collection_key

    def self.from_parser(klazz, collection_key, data)
      setup_collection_of_items(klazz, collection_key, data)
      self.attributes *data.keys
      collection = new(data)
      collection.collection_key = collection_key
      collection
    end

    def each(&block)
      collection_accessor.each(&block)
    end

    def method_missing(sym, *args, &block)
      if collection_accessor.respond_to?(sym)
        collection_accessor.call(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    private

    def collection_accessor
      send(collection_key)
    end

    def self.setup_collection_of_items(klazz, collection_key, attributes)
      collection = []
      attributes.delete(collection_key).each do |object_attributes|
        collection << klazz.from_api(object_attributes.symbolize_keys!)
      end
      attributes[collection_key] = collection
    end

  end
end
