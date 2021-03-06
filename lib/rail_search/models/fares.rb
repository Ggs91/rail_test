# frozen_string_literal: true

module RailSearch
  class Fares < Array
    def initialize(raw_fares)
      raw_fares.each_element { |raw_fare| fares << Fare.new(raw_fare) }
    end

    def cheapest
      fares.min_by(&:price)
    end

    private

    def fares
      self
    end
  end
end
