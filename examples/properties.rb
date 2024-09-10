require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Property Examples
# =========================================

rv_client.properties.each do |property|
  puts property.address
end

# ===========================

property_id = 13
rv_obj = rv_client.property(property_id)
puts rv_obj.address

# ===========================

new_property = Rentvine::Property.new
new_property.address = '123 Main St'
new_property.city = 'Reno'
new_property.state_id = 'NV'
new_property.postal_code = '89509'
new_property.county = 'Washoe'
new_property.country_id = 'US'
new_property.property_image_id = 1
new_property.property_type_id = 1
new_property.is_multi_unit = 0
new_property.portfolio_id = 7
new_property.management_fee_setting_id = 1
new_property.date_time_created = '2022-07-23 22:06:17'
new_property.reserve_amount = '1200.00'
new_property.is_active = 1
new_property.is_from_import = 0
new_property.unit = {
  rent: '1250.00',
  deposit: '1000.00',
  beds: '2',
  full_baths: '1',
  size: 988
}

new_property_saved_or_rentvine_error = rv_client.save_property(new_property)
if new_property_saved_or_rentvine_error.is_a?(Rentvine::RentvineError)
  puts new_property_saved_or_rentvine_error.message
else
  puts new_property_saved_or_rentvine_error.address
end

puts '---------------------------------'

property_id = 13
rv_client.activate_property(13)
puts 'Property 13 activated'

puts '---------------------------------'

property_id = 13
rv_client.deactivate_property(13)
puts 'Property 13 deactivated'

puts '---------------------------------'

property_id = new_property_saved_or_rentvine_error.property_id
rv_client.delete_property(property_id)

puts '---------------------------------'
