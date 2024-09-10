module Rentvine
  class Client
    module Bills
      def bills(args = {})
        results = process_request(:get, 'accounting/bills', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Bill.new(result[:bill])
          rvobj.contact = Rentvine::Vendor.new(result[:contact])
          rvobj.meta = { appends: [:contact] }
          rvobj
        end
      end
      alias list_bills bills

      def bill(bill_id)
        result = process_request(:get, "accounting/bills/#{bill_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Bill.new(result[:bill])
      end

      def save_bill(bill_model)
        result = process_request(:post, 'accounting/bills', body: bill_model.to_rentvine_hash)
        return result if result.is_a?(RentvineError)

        Rentvine::Bill.new(result[:bill])
      end
    end
  end
end
