# frozen_string_literal: true

module RailSearch
  module Serializers
    class FaresSerializer < BaseSerializer
      def initialize(_fares)
        @fares = _fares
      end

      def serialize
        {
          fares: @fares.map { |fare| FareSerializer.serialize(fare) }
        }
      end
    end
  end
end
