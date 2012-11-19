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
      send(collection_key).each { |item| block.call(item) }
    end

    def empty?
      send(collection_key).empty?
    end

    private

    def self.setup_collection_of_items(klazz, collection_key, attributes)
      collection = []
      attributes.delete(collection_key).each do |object_attributes|
        collection << klazz.from_api(object_attributes.symbolize_keys!)
      end
      attributes[collection_key] = collection
    end

  end
end
