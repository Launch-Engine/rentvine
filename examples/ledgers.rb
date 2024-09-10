require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Ledger Examples
# =========================================

search_for = 'Hays'
rv_client.ledgers(search_for).each do |ledger|
  puts [ledger.ledger_id, ledger.name].join(' :: ')
end

# ===========================

args = {
  search: 'Hays',
  is_active: 1
}
rv_client.search_ledgers(args).each do |ledger|
  puts ledger.name
end
