module Restulicious
  module Adapter
    class Default

      def initialize(klazz, key)
        @klazz = klazz
        @key   = key
      end

      def get(url, params, &block)
        request = ::Typhoeus::Request.new(url,
          method:        :get,
          headers:       { Accept: "application/json" },
          timeout:       100000, # milliseconds
          cache_timeout: 60, # seconds
          params:        params)
        hydra.queue(request)
        if block_given?
          request.on_complete do |response|
            block.call(parser(response).result)
          end
        else
          hydra.run
          parser(request.response).result
        end
      end

      def post(url, params, &block)
        request = ::Typhoeus::Request.new(url,
          method:        :post,
          headers:       { Accept: "application/json" },
          timeout:       100000, # milliseconds
          cache_timeout: 60, # seconds
          body:          params.to_json)
        hydra.queue(request)
        if block_given?
          request.on_complete do |response|
            block.call(parser(response).result)
          end
        else
          hydra.run
          parser(request.response).result
        end
      end

      def parser(response)
        Restulicious.config.parser_class.new(@klazz, @key, response)
      end

      def hydra
        Restulicious.config.hydra
      end
    end
  end
end


