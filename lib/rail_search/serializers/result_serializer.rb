# frozen_string_literal: true

module RailSearch
  module Serializers
    class ResultSerializer < BaseSerializer
      def initialize(_result)
        @result = RailSearch::Decorators::ResultDecorator.decorate(_result)
      end

      def serialize
        {
          id: @result.id,
          connections: {
            connections: RailSearch::Serializers::ConnectionsSerializer.serialize(@result.connections),
            train_changes: @result.train_changes,
            total_duration: @result.total_duration
          }
        }
      end
    end
  end
end
