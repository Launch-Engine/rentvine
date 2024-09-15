module Rentvine
  class Client
    module Leases
      def leases(args = {})
        results = process_request(:get, 'leases', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Lease.new(result[:lease]) }
      end
      alias list_leases leases

      def lease(lease_id)
        result = process_request(:get, "leases/#{lease_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Lease.new(result[:lease])
      end

      def export_leaeses(args = {})
        results = process_request(:get, 'leases/export', params: args)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Lease.new(result[:lease])
          rvobj.balance = Rentvine::Balance.new(result[:balances])
          rvobj.balances = rvobj.balance
          rvobj.tenants = result[:lease][:tenants].map { |tenant| Rentvine::Tenant.new(tenant) }
          rvobj.property = Rentvine::Property.new(result[:property])
          rvobj.unit = Rentvine::Unit.new(result[:unit])
          rvobj.portfolio = Rentvine::Unit.new(result[:portfolio])
          rvobj.meta = { appends: [:balances, :balance, :tenants, :property, :unit, :portfolio] }
          rvobj
        end
      end
    end
  end
end
