module Restulicious
  class Coordinator

    attr_accessor :request_options, :headers

    def initialize(klazz, api_options)
      @klazz = klazz
      api_options(api_options)
      @request_options ||= {}
      @headers ||= {}
    end

    def query_interface
      @query_interface ||= Restulicious::QueryInterface.new(@url)
    end

    def basic_auth(username, password)
      request_options[:username] = username
      request_options[:password] = password
      self
    end

    def headers(header_hash)
      header_hash.each do |key, value|
        @headers[key] = value
      end
      self
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
      option ||= {}
      @url  = options[:url]
      @type = options[:type]
      @key  = options[:key]
    end

    private

    def adapter
      @adapter ||= Restulicious.config.adapter_class.new(@klazz, key, request_options, @headers)
    end

    def key
      @key || @klazz.to_s.downcase.pluralize
    end

  end
end
