module Rentvine
  class RecurringCharge < RentvineModel
    def initialize(data = {})
      super(data)
    end

    def to_rentvine_hash
      retval = super()
      account = retval.delete(:account)
      {
        recurring_charge: retval,
        account: account
      }
    end
  end
end
