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

    def all_url
      interpolated_url
    end

    def first_url
      [interpolated_url, @params[:id]].compact.join("/")
    end

    private

    def interpolated_url
      interpolated_url = @url
      @params.each do |key, value|
        interpolated_url.gsub! /:#{key}/, value.to_s
      end
      interpolated_url
    end

  end
end
