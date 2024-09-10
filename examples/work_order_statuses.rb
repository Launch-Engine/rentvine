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

rv_client.work_order_statuses.each do |work_order_status|
  puts work_order_status.work_order_status_id
end

# ===========================

work_order_status_id = 7
rv_obj = rv_client.work_order_status(work_order_status_id)
puts rv_obj.work_order_status_id

# ===========================

new_work_order_status = Rentvine::WorkOrderStatus.new
new_work_order_status.primary_work_order_status_id = 1
new_work_order_status.name = 'Wes Work Order Status'

new_work_order_status_saved_or_rentvine_error = rv_client.save_work_order_status(new_work_order_status)
if new_work_order_status_saved_or_rentvine_error.is_a?(Rentvine::RentvineError)
  puts new_work_order_status_saved_or_rentvine_error.message
else
  puts new_work_order_status_saved_or_rentvine_error.work_order_status_id
end
