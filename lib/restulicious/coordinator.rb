module Restulicious
  class Coordinator

    def initialize(klazz)
      @klazz = klazz
    end

    def query_interface
      @query_interface ||= Restulicious::QueryInterface.new(@url)
    end

    def where(*args)
      query_interface.where(*args)
      self
    end

    def from(*args)
      query_interface.from(*args)
      self
    end

    def limit(*args)
      query_interface.limit(*args)
      self
    end

    def offset(*args)
      query_interface.offset(*args)
      self
    end

    def select(*args)
      query_interface.select(*args)
      self
    end

    def first(&block)
      adapter.get(query_interface.first_url, query_interface.params, &block)
    end

    def all(&block)
      adapter.get(query_interface.first_url, query_interface.params, &block)
    end

    def create(&block)
      adapter.post(query_interface.first_url, query_interface.params, &block)
    end

    def on_failure(&block)
      adapter.on_failure(&block)
      self
    end

    def on_success(&block)
      adapter.on_success(&block)
      self
    end

    def on_complete(&block)
      adapter.on_complete(&block)
      self
    end

    def api_options(options)
      @url  = options[:url]
      @type = options[:type]
      @key  = options[:key]
    end

    private

    def adapter
      @adapter ||= Restulicious.config.adapter_class.new(@klazz, key)
    end

    def key
      @key || @klazz.to_s.downcase.pluralize
    end

  end
end
