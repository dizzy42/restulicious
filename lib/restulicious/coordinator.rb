module Restulicious
  class Coordinator

    def initialize(klazz)
      @klazz = klazz
      @after_complete_methods = []
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

    def includes(*args)
      @after_complete_methods = args
      self
    end

    def first
      @request = connection.get(query_interface.first_url, query_interface.params)
      hydra.queue(@request)
      hydra.run
      parse.first
    end

    def all
      @request = connection.get(query_interface.all_url, query_interface.params)
      hydra.queue(@request)
      hydra.run
      parse
    end

    def create
      @request = connection.post(query_interface.all_url, query_interface.params)
      hydra.queue(@request)
      hydra.run
      # parse
    end

    def api_options(options)
      @url  = options[:url]
      @type = options[:type]
    end

    private

    def connection
      Connection.new
    end

    def parse
      objects = Restulicious::Parser.new(@klazz, @request.response.body).objects
      @after_complete_methods.each do |name|
        @klazz.send("after_api_complete_#{name}", objects)
      end
      objects
    end

    def hydra
      @hydra ||= Restulicious.hydra
    end

  end
end
