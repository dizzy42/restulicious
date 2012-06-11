module RestResource
  class Coordinator

    delegate :where,
      :from,
      :limit,
      :offset,
      :select,
      to: :query_interface

    def query_interface
      @query_interface ||= RestResource::QueryInterface.new(@url)
    end

    def first
      request = connection.get(query_interface.first_url, query_interface.params)
      hydra.queue(request)
      hydra.run
      parse(request.response)
    end

    def all
      request = connection.get(query_interface.all_url, query_interface.params)
      hydra.queue(request)
      hydra.run
      parse(request.response)
    end

    def api_options(options)
      @url = options[:url]
    end

    private

    def parse(response)
      RestResource::Parser.new(@klazz, response)
    end

    def hydra
      @hydra ||= Typhoeus::Hydra.new
    end

  end
end
