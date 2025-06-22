module Rentvine
  class Client
    module RecurringCharges
      def recurring_charges(lease_id, args = {})
        results = process_request(:get, "leases/#{lease_id}/recurring-charges", params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::RecurringCharge.new(result[:recurring_charge]) }
      end
      alias list_recurring_charges recurring_charges

      def recurring_charge(lease_id, recurring_charge_id)
        result = process_request(:get, "leases/#{lease_id}/recurring-charges/#{recurring_charge_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::RecurringCharge.new(result[:recurring_charge])
      end
    end
  end
end
