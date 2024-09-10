require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Vendor Trade Examples
# =========================================

rv_client.vendor_trades.each do |vendor_trade|
  puts vendor_trade.vendor_trade_id
end

# ===========================

vendor_trade_id = 1
rv_obj = rv_client.vendor_trade(vendor_trade_id)
puts rv_obj.vendor_trade_id

# ===========================

new_vendor_trade = Rentvine::WorkOrderStatus.new
new_vendor_trade.name = 'Welding'
new_vendor_trade.is_visible_tenant_portal = 1

new_vendor_trade_saved_or_rentvine_error = rv_client.save_vendor_trade(new_vendor_trade)
if new_vendor_trade_saved_or_rentvine_error.is_a?(Rentvine::RentvineError)
  puts new_vendor_trade_saved_or_rentvine_error.message
else
  puts new_vendor_trade_saved_or_rentvine_error.vendor_trade_id
end
