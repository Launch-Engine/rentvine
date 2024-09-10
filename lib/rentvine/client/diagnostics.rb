module Rentvine
  class Client
    module Diagnostics
      def bank_account_reconciliation_lapse
        results = process_request(:get, '/accounting/diagnostics/bank-account-reconciliation-lapse')
        return results if results.is_a?(RentvineError)
        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def credit_debit_mismatch
        results = process_request(:get, '/accounting/diagnostics/credit-debit-mismatch')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def escrow_mismatch
        results = process_request(:get, '/accounting/diagnostics/escrow-mismatch')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def manager_ledger_balance
        result = process_request(:get, '/accounting/diagnostics/manager-ledger-balance')
        return result if result.is_a?(RentvineError)

        Rentvine::Diagnostic.new(result)
      end

      def negative_bank_accounts
        results = process_request(:get, '/accounting/diagnostics/negative-bank-accounts')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def prepayment_mismatch
        results = process_request(:get, '/accounting/diagnostics/prepayment-mismatch')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def reserve_not_met
        results = process_request(:get, '/accounting/diagnostics/reserve-not-met')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def suppressed_fee_balance_mismatch
        results = process_request(:get, '/accounting/diagnostics/suppressed-fee-balance-mismatch')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def unused_prepayments
        results = process_request(:get, '/accounting/diagnostics/unused-prepayments')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def unused_vendor_credits
        results = process_request(:get, '/accounting/diagnostics/unused-vendor-credits')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end

      def vendor_insurance_lapse
        results = process_request(:get, '/accounting/diagnostics/vendor-insurance-lapse')
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Diagnostic.new(result) }
      end
    end
  end
end
