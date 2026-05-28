require 'pry-byebug'
require 'dotenv'
require_relative '../lib/rentvine'

Dotenv.load('../.env')

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Tenant Examples
# =========================================

rv_client.tenants.each do |tenant|
  puts tenant.name
end

# ===========================

tenant_id = 46
rv_obj = rv_client.tenant(tenant_id)
puts rv_obj.first_name
