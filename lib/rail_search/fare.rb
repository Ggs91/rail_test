# frozen_string_literal: true

module RailSearch
  class Fare
    attr :name, :currency, :value

    def initialize(raw_fare)
      fare_elements = raw_fare.elements

      @name     = fare_elements['Name'].text
      @currency = fare_elements['//Price/Currency'].text
      @value    = fare_elements['//Price/Value'].text.to_i
    end

    def inspect
      { name: @name, price: price }
    end

    def price
      { currency: @currency, value: @value }
    end
  end
end
