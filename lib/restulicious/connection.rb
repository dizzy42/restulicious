module Restulicious
  class Connection

    def get(url, params)
      request = ::Typhoeus::Request.new(url,
        method:        :get,
        headers:       { Accept: "application/json" },
        timeout:       100000, # milliseconds
        cache_timeout: 60, # seconds
        params:        params)
    end

    def post(url, params)
      request = ::Typhoeus::Request.new(url,
        method:        :post,
        headers:       { Accept: "application/json" },
        timeout:       100000, # milliseconds
        cache_timeout: 60, # seconds
        body:          params.to_json)
    end

  end
end

