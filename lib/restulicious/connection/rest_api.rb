module Restulicious
  module Connection
    class RESTApi

      def get(url, params)
        ::RESTApi.get(url, params)
      end

      def post(url, params)
        ::RESTApi.post(url, params)
      end

    end
  end
end



