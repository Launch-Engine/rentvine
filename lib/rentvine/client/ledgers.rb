module Rentvine
  class Client
    module Ledgers
      def ledgers(search)
        results = process_request(:get, 'accounting/ledgers', params: { search: search })
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Ledger.new(result[:ledger]) }
      end
      alias list_ledgers ledgers

      def search_ledgers(args = {})
        results = process_request(:get, 'accounting/ledgers/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Ledger.new(result[:ledger])
          rvobj.unit = Rentvine::Unit.new(result[:unit])
          rvobj.meta = { appends: [:unit] }
          rvobj
        end
      end
    end
  end
end
