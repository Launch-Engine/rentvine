module Rentvine
  class Client
    module WorkOrderStatuses
      def work_order_statuses(args = {})
        results = process_request(:get, 'maintenance/work-order/statuses', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::WorkOrderStatus.new(result[:work_order_status]) }
      end
      alias list_work_order_statuses work_order_statuses

      def work_order_status(work_order_status_id)
        result = process_request(:get, "maintenance/work-order/statuses/#{work_order_status_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::WorkOrderStatus.new(result[:work_order_status])
      end

      def save_work_order_status(work_order_status_model)
        result = process_request(
          :post, '/maintenance/work-order/statuses',
          body: work_order_status_model.to_rentvine_hash
        )
        return result if result.is_a?(RentvineError)

        Rentvine::WorkOrderStatus.new(result[:work_order_status])
      end
    end
  end
end
