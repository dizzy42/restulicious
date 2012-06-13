module RestResource
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

      def includes(*args)
        coordinator.includes(*args)
      end

      def first
        coordinator.first
      end

      def all
        coordinator.all
      end

      private

      def api_options(options)
        coordinator.api_options(options)
      end

      def coordinator
        @coordinator ||= RestResource::Coordinator.new(self)
      end

    end
  end
end
