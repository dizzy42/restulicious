module RestResource
  class QueryInterface

    attr_reader :params

    def initialize(url)
      @url = url
      @params = {}
    end

    def where(params)
      @params.merge!(params)
      self
    end

    def from(url)
      @url = url
      self
    end

    def limit(limit)
      @params[:limit] = limit
      self
    end

    def offset(offset)
      @params[:offset] = offset
      self
    end

    def select(fields)
      @params[:fields] = fields
      self
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
        interpolated_url = interpolated_url.gsub /:#{key}/, value.to_s
      end
      interpolated_url
    end

  end
end
