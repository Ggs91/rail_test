# frozen_string_literal: true

module RailSearch
  class Results < Array
    def initialize(raw_results)
      raw_results.each { |raw_result| results << Result.new(raw_result) }
    end

    def cheapest
      cheapests = Hash.new { |h, k| h[k] = [] }

      results.map(&:prices_by_fares).flat_map(&:entries).group_by(&:first).map { |k, v| cheapests[k] = v.map(&:last) }

      cheapests.map { |k, v| cheapests[k] = cheapests[k].min }

      cheapests
    end

    def quickest
      results.map { |result| { result.id => result.total_duration } }.flat_map(&:entries).min_by(&:last)
    end

    def inspect
      formatted_quickest = { quickest.first => Utils::TimeUtils.format_in_hours_minutes(quickest.last) }

      { results: results.map(&:inspect), cheapest: cheapest, quickest: formatted_quickest }
    end

    private

    def results
      self
    end
  end
end
