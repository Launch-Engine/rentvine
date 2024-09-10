module Rentvine
  class Client
    module Owners
      def owners(args = {})
        results = process_request(:get, 'owners/search', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Owner.new(result[:contact]) }
      end
      alias list_owners owners
    end
  end
end
