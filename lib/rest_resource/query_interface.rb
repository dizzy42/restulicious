module RestResource
  class QueryInterface

    def initialize(url)
      @url = url
      @params = {}
    end

    def where(params)
      @params.merge!(params)
    end

    def from(url)
      @url = url
    end

    def limit(limit)
      @params[:limit] = limit
    end

    def offset(offset)
      @params[:offset] = offset
    end

    def select(fields)
      @params[:fields] = fields
    end

    private

    def all_url
      # interpolated_url
      @url
    end

  end
end
