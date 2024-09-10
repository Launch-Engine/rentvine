module Rentvine
  class Client
    module Transactions
      def transactions(args = {})
        results = process_request(:get, 'accounting/transactions/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Transaction.new(result[:transaction])
          rvobj.ledger = Rentvine::Ledger.new(result[:ledger])
          rvobj.portfolio = Rentvine::Portfolio.new(result[:portfolio])
          rvobj.unit = Rentvine::Unit.new(result[:unit])
          rvobj.transaction_entries = Rentvine::TransactionEntry.new(result[:transaction_entries])
          rvobj.meta = { appends: [:ledger, :portfolio, :unit, :transaction_entries] }
          rvobj
        end
      end
      alias list_transactions transactions
    end
  end
end
