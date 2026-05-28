module Rentvine
  class Client
    module LeaseStatuses
      def lease_statuses(args = {})
        results = process_request(:get, 'leases/statuses', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::LeaseStatus.new(result[:lease_status]) }
      end
      alias list_lease_statuses lease_statuses

      def lease_status(lease_status_id)
        result = process_request(:get, "leases/statuses/#{lease_status_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::LeaseStatus.new(result[:lease_status])
      end
    end
  end
end
