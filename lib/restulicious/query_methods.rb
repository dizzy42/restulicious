module Restulicious
  module QueryMethods
    extend ::ActiveSupport::Concern

    module ClassMethods

      def where(params)
        coordinator.where(params)
      end

      def from(url)
        coordinator.from(url)
      end

      def limit(limit)
        coordinator.limit(limit)
      end

      def offset(offset)
        coordinator.offset(offset)
      end

      def select(fields)
        coordinator.select(fields)
      end

      def first(&block)
        coordinator.first(&block)
      end

      def all(&block)
        coordinator.all(&block)
      end

      def create(&block)
        coordinator.create(&block)
      end

      private

      def api_options(options)
        @api_options = options
      end

      def coordinator
        Restulicious::Coordinator.new(self, @api_options)
      end

    end
  end
end
