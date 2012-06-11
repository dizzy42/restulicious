module RestResource
  class Coordinator

    delegate :where,
      :from,
      :limit,
      :offset,
      :select,
      to: :query_interface

    def initialize(klazz)
      @klazz = klazz
    end

    def query_interface
      @query_interface ||= RestResource::QueryInterface.new(@url)
    end

    def first
      request = connection.get(query_interface.first_url, query_interface.params)
      hydra.queue(request)
      hydra.run
      parse(request.response.body)
    end

    def all
      request = connection.get(query_interface.all_url, query_interface.params)
      hydra.queue(request)
      hydra.run
      parse(request.response.body)
    end

    def api_options(options)
      @url = options[:url]
    end

    private

    def connection
      Connection.new
    end

    def parse(body)
      RestResource::Parser.new(@klazz, body).objects
    end

    def hydra
      @hydra ||= Typhoeus::Hydra.new
    end

  end
end
