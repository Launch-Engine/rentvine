require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Inspection Examples
# =========================================

rv_client.inspections.each do |inspection|
  puts inspection.inspection_id
end

# ===========================

inspection_id = 1
rv_obj = rv_client.inspection(inspection_id)
puts rv_obj.inspection_id

# ===========================

new_inspection = Rentvine::WorkOrderStatus.new
new_inspection.unit_id = 14
new_inspection.inspection_type_id = 1
new_inspection.inspection_status_id = 1

new_inspection_saved_or_rentvine_error = rv_client.save_inspection(new_inspection)
if new_inspection_saved_or_rentvine_error.is_a?(Rentvine::RentvineError)
  puts new_inspection_saved_or_rentvine_error.message
else
  puts new_inspection_saved_or_rentvine_error.inspection_id
end
