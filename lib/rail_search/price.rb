# frozen_string_literal: true

module RailSearch
  class Price
    attr :currency, :value

    def initialize(raw_price)
      price_elements = raw_price.elements

      @currency = fare_elements['//Currency'].text
      @value    = fare_elements['//Value'].text.to_i
      # @currency = fare_elements['//Price/Currency'].text
      # @value    = fare_elements['//Price/Value'].text.to_i
    end

    def inspect
      { currency: @currency, value: @value }
    end
  end
end
