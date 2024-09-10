require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Work Order Examples
# =========================================

rv_client.work_orders.each do |work_order|
  puts work_order.work_order_id
end

# ===========================

work_order_id = 7
rv_obj = rv_client.work_order(work_order_id)
puts rv_obj.work_order_id

# ===========================

new_work_order = Rentvine::WorkOrder.new
new_work_order.property_id = 32
new_work_order.work_order_status_id = 1
new_work_order.priority_id = 1
new_work_order.is_owner_approved = 1
new_work_order.is_vacant = 0
new_work_order.description = 'This is something to fix'
new_work_order.is_shared_with_tenant = 1
new_work_order.is_shared_with_owner = 1

new_work_order_saved_or_rentvine_error = rv_client.save_work_order(new_work_order)
if new_work_order_saved_or_rentvine_error.is_a?(Rentvine::RentvineError)
  puts new_work_order_saved_or_rentvine_error.message
else
  puts new_work_order_saved_or_rentvine_error.work_order_id
end
