module Rentvine
  class Client
    module Inspections
      def inspections(args = {})
        results = process_request(:get, 'maintenance/inspections', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Inspection.new(result[:inspection]) }
      end
      alias list_inspections inspections

      def inspection(inspection_id)
        result = process_request(:get, "maintenance/inspections/#{inspection_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Inspection.new(result[:inspection])
      end

      def save_inspection(inspection_model)
        result = process_request(:post, '/maintenance/inspections', body: inspection_model.to_rentvine_hash)
        return result if result.is_a?(RentvineError)

        Rentvine::Inspection.new(result[:inspection])
      end
    end
  end
end
