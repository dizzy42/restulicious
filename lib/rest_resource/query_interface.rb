module RestResource
  class QueryInterface

    def initialize
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

    def first
    end

    def all
    end

  end
end
