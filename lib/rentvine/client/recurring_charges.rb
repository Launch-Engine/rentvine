module Rentvine
  class Client
    module RecurringCharges
      def recurring_charges(lease_id, args = {})
        results = process_request(:get, "leases/#{lease_id}/recurring-charges", params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::RecurringCharge.new(result[:recurring_charge]) }


        results.map do |result|
          rvobj = Rentvine::RecurringCharge.new(result[:recurring_charge])
          rvobj.account = Rentvine::Account.new(result[:account])
          rvobj.meta = { appends: [:account] }
          rvobj
        end
      end
      alias list_recurring_charges recurring_charges

      def recurring_charge(lease_id, recurring_charge_id)
        result = process_request(:get, "leases/#{lease_id}/recurring-charges/#{recurring_charge_id}")
        return result if result.is_a?(RentvineError)

        retval = Rentvine::RecurringCharge.new(result[:recurring_charge])
        retval.previous_charge = if result[:previous_charge].nil?
                                   nil
                                 else
                                   Rentvine::RecurringCharge.new(result[:previous_charge])
                                 end
        retval
      end
    end
  end
end
