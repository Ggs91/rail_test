# frozen_string_literal: true

module RailSearch
  class Fare
    attr :name, :currency, :price

    def initialize(raw_fare)
      fare_elements = raw_fare.elements

      @name     = fare_elements['Name'].text
      @currency = fare_elements['Price/Currency'].text
      @price    = fare_elements['Price/Value'].text.to_f
    end
  end
end
