module Rentvine
  class Client
    module Accounts
      def accounts(args = {})
        results = process_request(:get, 'accounting/accounts', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Account.new(result[:account]) }
      end
      alias list_accounts accounts
    end
  end
end
