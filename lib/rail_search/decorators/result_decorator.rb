# frozen_string_literal: true

module RailSearch
  module Decorators
    class ResultDecorator < BaseDecorator
      extend Forwardable

      def_delegators :@connections, :train_changes_count, :train_waiting_durations
      def_delegators :@result, :id, :connections

      def initialize(_result)
        @result      = _result
        @connections = _result.connections
      end

      def total_duration
        Utils::TimeUtils.format_in_hours_minutes(@result.total_duration)
      end

      def train_changes
        {
          count: train_changes_count,
          waiting_durations: format_train_waiting_durations
        }
      end

      private

      def format_train_waiting_durations
        train_waiting_durations.map do |waiting_duration|
          Utils::TimeUtils.format_in_hours_minutes(waiting_duration)
        end
      end
    end
  end
end

