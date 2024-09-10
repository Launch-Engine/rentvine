module Rentvine
  class Client
    module VendorTrades
      def vendor_trades(args = {})
        results = process_request(:get, 'maintenance/vendor-trades', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::VendorTrade.new(result[:vendor_trade]) }
      end
      alias list_vendor_trades vendor_trades

      def vendor_trade(vendor_trade_id)
        result = process_request(:get, "maintenance/vendor-trades/#{vendor_trade_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::VendorTrade.new(result[:vendor_trade])
      end

      def save_vendor_trade(vendor_trade_model)
        result = process_request(:post, '/maintenance/vendor-trades', body: vendor_trade_model.to_rentvine_hash)
        return result if result.is_a?(RentvineError)

        Rentvine::VendorTrade.new(result[:vendor_trade])
      end
    end
  end
end
