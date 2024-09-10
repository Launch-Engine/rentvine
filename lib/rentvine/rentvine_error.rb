# frozen_string_literal: true

module Rentvine
  class RentvineError < StandardError
    attr_reader :error
    attr_reader :raw
    attr_reader :response_code

    def initialize(http_response)
      @raw = http_response
      @response_code = @raw.response_code

      data = process_response_body
      if data.nil?
        set_default_error_message
      else
        @error = data
      end
    end

    def error?
      true
    end

    def to_s
      return remove_extra_quotes(@error) if @error.is_a?(String)

      retval = @error.each_with_object([]) do |(key, value), str|
        str_value = value.is_a?(Array) ? value.join(', ') : value
        str_value = remove_extra_quotes(str_value)
        str << "#{key}: #{str_value}"
      end
      retval.join(', ')
    end
    alias message to_s

    private

    def remove_extra_quotes(str)
      str.tr('"', '')
    end

    def process_response_body
      JSON.parse(@raw.body, symbolize_names: true).to_snake_keys unless @raw.body.empty?
    rescue StandardError
      @raw.body.strip
    end

    def set_default_error_message
      require 'uri'
      api_path = URI.parse(@raw.effective_url).path
      @error = "Rentvine API returned an error for #{api_path}."

      if @response_code == 401
        @error += ' Please check your credentials.'
      elsif @response_code == 404
        @error += ' Please check your API path.'
      end
    end
  end
end
