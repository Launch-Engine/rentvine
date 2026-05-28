module Rentvine
  class Client
    module Tenants
      def tenants(args = {})
        results = process_request(:get, 'tenants', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Tenant.new(result[:contact]) }
      end
      alias list_tenants tenants

      def tenant(tenant_id)
        result = process_request(:get, "tenants/#{tenant_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Property.new(result[:contact])
      end
    end
  end
end
