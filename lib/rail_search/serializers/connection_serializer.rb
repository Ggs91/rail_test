# frozen_string_literal: true

module RailSearch
  module Serializers
    class ConnectionSerializer < BaseSerializer
      def initialize(_connection)
        @connection = RailSearch::Decorators::ConnectionDecorator.decorate(_connection)
      end

      def serialize
        {
          start: @connection.start,
          finish: @connection.finish,
          departure_time: @connection.departure_time,
          arrival_time: @connection.arrival_time,
          train_name: @connection.train_name,
          duration: @connection.duration,
          fares: FaresSerializer.serialize(@connection.fares)
        }
      end
    end
  end
end
