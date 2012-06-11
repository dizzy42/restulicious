module RestResource
  class Connection

    def get(url, params)
      request = ::Typhoeus::Request.new(url,
        method:        :get,
        headers:       { Accept: "text/json" },
        timeout:       100, # milliseconds
        cache_timeout: 60, # seconds
        params:        params)
    end

  end
end

