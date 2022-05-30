# frozen_string_literal: true

module RailSearch
  module Serializers
    class FareSerializer < BaseSerializer
      def initialize(_fare)
        @fare = _fare
      end

      def serialize
        { name: @fare.name, currency: @fare.currency, price: @fare.price }
      end
    end
  end
end
