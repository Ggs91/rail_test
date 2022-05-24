# frozen_string_literal: true

module RailSearch
  class Connections < Array
    def initialize(raw_connections)
      raw_connections.each_element { |raw_connection| self << Connection.new(raw_connection) }
    end

    def train_changes_count
      connections.count - 1
    end

    def train_waiting_durations
      return unless train_changes_count.positive?

      connections.map.with_index do |connection, index|
        arrived_train = connection
        next_train    = connections[index + 1]

        next if next_train.nil?

        Utils::TimeUtils.duration_in_seconds_between(arrived_train.inspect[:arrival_time], next_train.inspect[:departure_time])
      end.compact
    end

    def format_train_waiting_durations
      train_waiting_durations.map do |waiting_duration|
        Utils::TimeUtils.format_in_hours_minutes(waiting_duration)
      end
    end

    def trains_durations
      connections.map(&:duration)
    end

    def total_duration
      Utils::TimeUtils.format_in_hours_minutes((trains_durations + train_waiting_durations).reduce(:+))
    end

    def inspect
      connections.map(&:inspect)
    end

    private

    def connections
      self
    end
  end
end
