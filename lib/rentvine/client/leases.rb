module Rentvine
  class Client
    module Leases
      def leases(args = {})
        results = process_request(:get, 'leases', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Lease.new(result[:lease]) }
      end
      alias list_leases leases

      def lease(lease_id)
        result = process_request(:get, "leases/#{lease_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Lease.new(result[:lease])
      end
    end
  end
end
