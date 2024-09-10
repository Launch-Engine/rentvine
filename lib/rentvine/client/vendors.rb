module Rentvine
  class Client
    module Vendors
      def vendors(args = {})
        results = process_request(:get, 'vendors/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Vendor.new(result[:contact]) }
      end
      alias list_vendors vendors
    end
  end
end
