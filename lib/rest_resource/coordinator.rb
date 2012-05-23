module RestResource
  class Coordinator

    delegate :where,
      :from,
      :limit,
      :offset,
      :select,
      # :first_url,
      # :all_url,
      # :params,
      to: :query_interface

    def query_interface
      @query_interface ||= RestResource::QueryInterface.new("")
    end

    def first
      # connection.request(first_url, params)
    end

    def all
      # connection.request(all_url, params)
    end

    def api_options(options)
      # @url = options[:url]
    end

  end
end
