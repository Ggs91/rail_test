# frozen_string_literal: true

module RailSearch
  class Results < Array
    def initialize(raw_results)
      raw_results.each { |raw_result| results << Result.new(raw_result) }
    end

    def cheapest
      results.min_by(&:cheapest_price)
    end

    def quickest
      results.min_by(&:total_duration)
    end

    private

    def results
      self
    end
  end
end
