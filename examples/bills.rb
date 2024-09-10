require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Bill Examples
# =========================================

rv_client.bills.each do |bill|
  puts bill.reference
end

# ===========================

bill_id = 2
rv_obj = rv_client.bill(bill_id)
puts rv_obj.reference

# ===========================

new_bill = Rentvine::Bill.new
new_bill.payee_contact_id = 22
new_bill.bill_type_id = 1
new_bill.bill_date = '2024-09-10'
new_bill.date_due = '2024-09-13'
new_bill.reference = '000112'
new_bill.payment_memo = 'Fixed shower'
new_bill.work_order_id = 6
new_bill.discount_percent
new_bill.markup_percent
new_bill.is_approved = 1
new_bill.approved_by_user_id = 146608
new_bill.is_discount = 0
new_bill.is_markup = 0
new_bill.management_fee_mode = 2
new_bill.charges = [
  {
    ledger_id: 64,
    description: 'Fixed shower',
    charge_account_id: 1,
    amount: '275.00'
  }
]

rv_obj = rv_client.save_bill(new_bill)

puts rv_obj.bill_id
puts rv_obj.reference
