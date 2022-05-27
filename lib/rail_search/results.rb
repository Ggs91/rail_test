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

    # RENDERING HELPERS

    def inspect
      { results: results.map(&:inspect), cheapest: cheapest, quickest: format_quickest }
    end

    def format_cheapest
      { id: cheapest.id, price: cheapest.cheapest_price }
    end

    def format_quickest
      formatted_duration = Utils::TimeUtils.format_in_hours_minutes(quickest.total_duration)

      { id: quickest.id, duration: formatted_duration }
    end

    private

    def results
      self
    end
  end
end
