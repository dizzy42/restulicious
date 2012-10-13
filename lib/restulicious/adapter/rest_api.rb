module Restulicious
  module Adapter
    class RESTApi

      def initialize(klazz, key)
        @klazz = klazz
        @key   = key
      end

      def get(url, params, &block)
        request = ::RESTApi.get(url, params)
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
        request = ::RESTApi.post(url, params)
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




