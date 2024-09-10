module Rentvine
  class Client
    module Units
      def units(property_id, args = {})
        results = process_request(:get, "properties/#{property_id}/units", params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Unit.new(result[:unit]) }
      end
      alias list_units units

      def unit(property_id, unit_id)
        result = process_request(:get, "properties/#{property_id}/units/#{unit_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Unit.new(result[:unit])
      end
    end
  end
end
