module Rentvine
  class Client
    module TransactionEntries
      def transaction_entries(args = {})
        results = process_request(:get, 'accounting/transactions/entries/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::TransactionEntry.new(result[:transaction_entry]) }

        results.map do |result|
          rvobj = Rentvine::TransactionEntry.new(result[:transaction_entry])
          rvobj.ledger = Rentvine::Ledger.new(result[:ledger])
          rvobj.portfolio = Rentvine::Portfolio.new(result[:portfolio])
          rvobj.primary_ledger = Rentvine::Ledger.new(result[:primary_ledger])
          rvobj.property = Rentvine::Property.new(result[:property])
          rvobj.transaction = Rentvine::Transaction.new(result[:transaction])
          rvobj.unit = Rentvine::Unit.new(result[:unit])
          rvobj.meta = { appends: [:ledger, :portfolio, :primary_ledger, :property, :transaction, :unit] }
          rvobj
        end
      end
      alias list_transaction_entries transaction_entries
    end
  end
end
