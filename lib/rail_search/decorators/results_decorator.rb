# frozen_string_literal: true

require 'forwardable'

module RailSearch
  module Decorators
    class ResultsDecorator < BaseDecorator
      extend Forwardable

      def_delegators :@results, :map
      def_delegator :@results, :cheapest, :cheapest_result
      def_delegator :@results, :quickest, :quickest_result

      def initialize(_results)
        @results = _results
      end

      def cheapest
        { id: cheapest_result.id, price: cheapest_result.cheapest_price }
      end

      def quickest
        formatted_duration = Utils::TimeUtils.format_in_hours_minutes(quickest_result.total_duration)

        { id: quickest_result.id, duration: formatted_duration }
      end
    end
  end
end
