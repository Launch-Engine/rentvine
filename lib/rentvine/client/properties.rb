module Rentvine
  class Client
    module Properties
      def properties(args = {})
        results = process_request(:get, 'properties', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Property.new(result[:property]) }
      end
      alias list_properties properties

      def property(property_id)
        result = process_request(:get, "properties/#{property_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::Property.new(result[:property])
      end

      def save_property(property_model)
        url_to_use = property_model.property_id.nil? ? 'properties' : "properties/#{property_model.property_id}"
        result = process_request(:post, url_to_use, body: property_model.to_rentvine_hash)
        return result if result.is_a?(RentvineError)

        Rentvine::Property.new(result[:property])
      end

      def delete_property(property_id)
        result = process_request(:delete, "properties/#{property_id}")
        return result if result.is_a?(RentvineError)

        true
      end

      def activate_property(property_id)
        result = process_request(:post, "properties/#{property_id}/activate")
        return result if result.is_a?(RentvineError)

        true
      end

      def deactivate_property(property_id)
        result = process_request(:post, "properties/#{property_id}/deactivate")
        return result if result.is_a?(RentvineError)

        true
      end
    end
  end
end
