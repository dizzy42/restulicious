#TODO: Split out this adapter into a separate gem
module Restulicious
  module Adapter
    class RESTApi

      def initialize(klazz, key, request_options, headers)
        @klazz = klazz
        @key   = key
      end

      def get(url, params, &block)
        @request = ::RESTApi.get(url, params)
        handle_response(&block)
      end

      def post(url, params, &block)
        @request = ::RESTApi.post(url, params)
        handle_response(&block)
      end

      def put(url, params, &block)
        @request = ::RESTApi.put(url, params)
        handle_response(&block)
      end

      def on_success(&block)
        @on_success = block
      end

      def on_complete(&block)
        @on_complete = block
      end

      def on_failure(&block)
        @on_failure = block
      end

      private

      def parser(response)
        Restulicious.config.parser_class.new(@klazz, @key, response.body)
      end

      #TODO: Check whether this can be deleted
      def hydra
        Restulicious.config.hydra
      end

      def should_run_request?(&block)
        !block_given? && !@on_success && !@on_complete
      end

      def run_request
        @request.queue if @request.respond_to?(:queue)
        ::RESTApi.run
        parser(@request.response).result
      end

      def handle_response(&block)
        if @on_success
          @request.on_success do |response|
            @on_success.call(parser(response).result)
          end
        end
        if @on_complete
          @request.on_complete do |response|
            @on_complete.call(parser(response).result)
          end
        end
        if @on_failure
          @request.on_failure do |response, exception|
            @on_failure.call(response, exception)
          end
        end
        if block_given?
          @request.on_complete do |response|
            if response.success?
              block.call(parser(response).result)
            end
          end
        end
        if should_run_request?(&block)
          run_request
        else
          @request.queue if @request.respond_to?(:queue)
          @request
        end
      end
    end
  end
end




