# frozen_string_literal: true

module RailSearch
  class Fares < Array
    def initialize(raw_fares)
      raw_fares.each_element { |raw_fare| self << Fare.new(raw_fare) }
    end

    def inspect
      self.map(&:inspect)
    end
  end
end
