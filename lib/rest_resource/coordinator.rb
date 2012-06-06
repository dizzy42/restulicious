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
      # @response = connection.request(:get, query_interface.first_url, query_interface.params).response
      # parse
    end

    def all
      # @response = connection.request(:get, query_interface.all_url, query_interface.params).response
      # parse
    end

    def api_options(options)
      @url = options[:url]
    end

    private

    # def parse
    #   RestResource::Parser.new(@klazz, @response)
    # end

  end
end
