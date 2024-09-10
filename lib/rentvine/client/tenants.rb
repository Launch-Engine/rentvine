module Rentvine
  class Client
    module Tenants
      def tenants(args = {})
        results = process_request(:get, 'tenants/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Tenant.new(result[:contact]) }
      end
      alias list_tenants tenants
    end
  end
end
