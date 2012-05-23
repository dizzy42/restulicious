module RestResource
  class Coordinator

    delegate :where,
      :from,
      :limit,
      :offset,
      :select,
      to: :query_interface

    def query_interface
      @query_interface ||= RestResource::QueryInterface.new("")
    end

    def first
    end

    def all
    end

    def api_options(options)
    end

  end
end
