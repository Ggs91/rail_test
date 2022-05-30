# frozen_string_literal: true

module RailSearch
  module Serializers
    class ResultsSerializer < BaseSerializer
      def initialize(_results)
        @results = RailSearch::Decorators::ResultsDecorator.decorate(_results)
      end

      def serialize
        {
          results: @results.map { |result| ResultSerializer.serialize(result) },
          cheapest: @results.cheapest,
          quickest: @results.quickest
        }
      end
    end
  end
end
