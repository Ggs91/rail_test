# frozen_string_literal: true

module RailSearch
  module Decorators
    class ConnectionDecorator < BaseDecorator
      extend Forwardable

      def_delegators :@connection, :start, :finish, :departure_time, :arrival_time, :train_name, :fares, :duration

      def initialize(_connection)
        @connection = _connection
      end

      def duration
        Utils::TimeUtils.format_in_hours_minutes(@connection.duration)
      end
    end
  end
end
