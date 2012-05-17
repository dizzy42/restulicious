module RestResource
  class Coordinator

    delegate :where,
      :from,
      :limit,
      :offset,
      :select,
      :first,
      :all,
      to: :query_interface

    def query_interface
      RestResource::QueryInterface.new
    end

    def api_options(options)
    end

  end
end
