module Rentvine
  class Property < RentvineModel
    def initialize(data = {})
      super(data)
    end

    def to_rentvine_hash
      retval = super()
      unit = retval.delete(:unit)
      {
        property: retval,
        unit: unit
      }
    end
  end
end
