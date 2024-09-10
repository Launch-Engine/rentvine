require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Diagnostic Examples
# =========================================

rv_obj = rv_client.bank_account_reconciliation_lapse
puts rv_obj.size

# ===========================

rv_obj = rv_client.credit_debit_mismatch
puts rv_obj.size

# ===========================

rv_obj = rv_client.escrow_mismatch
puts rv_obj.size

# ===========================

# THIS IS NOT AN ARRAY??
rv_obj = rv_client.manager_ledger_balance
puts rv_obj.size

# ===========================

rv_obj = rv_client.negative_bank_accounts
puts rv_obj.size

# ===========================

rv_obj = rv_client.prepayment_mismatch
puts rv_obj.size

# ===========================

rv_obj = rv_client.reserve_not_met
puts rv_obj.size

# ===========================

rv_obj = rv_client.suppressed_fee_balance_mismatch
puts rv_obj.size

# ===========================

rv_obj = rv_client.unused_prepayments
puts rv_obj.size

# ===========================

rv_obj = rv_client.unused_vendor_credits
puts rv_obj.size

# ===========================

rv_obj = rv_client.vendor_insurance_lapse
puts rv_obj.size
