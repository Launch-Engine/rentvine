module Rentvine
  class Client
    module WorkOrders
      def work_orders(args = {})
        results = process_request(:get, 'maintenance/work-orders', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::WorkOrder.new(result[:work_order]) }
      end
      alias list_work_orders work_orders

      def work_order(work_order_id)
        result = process_request(:get, "maintenance/work-orders/#{work_order_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::WorkOrder.new(result[:work_order])
      end

      def save_work_order(work_order_model)
        result = process_request(:post, '/maintenance/work-orders', body: work_order_model.to_rentvine_hash)
        return result if result.is_a?(RentvineError)

        Rentvine::WorkOrder.new(result[:work_order])
      end
    end
  end
end
