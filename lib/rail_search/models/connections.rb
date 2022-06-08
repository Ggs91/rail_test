# frozen_string_literal: true

module RailSearch
  class Connections < Array
    TERMINAL_CONNECTION = 1

    def initialize(raw_connections)
      raw_connections.each_element { |raw_connection| self << Connection.new(raw_connection) }
    end

    def train_changes_count
      connections.count - TERMINAL_CONNECTION
    end

    def train_waiting_durations
      return unless train_changes_count.positive?

      connections.map.with_index do |connection, index|
        arrived_train = connection
        next_train    = connections[index + 1]

        next if next_train.nil?

        Utils::TimeUtils.duration_in_seconds_between(arrived_train.arrival_time, next_train.departure_time)
      end.compact
    end

    def trains_durations
      connections.map(&:duration)
    end

    def total_duration
      (trains_durations + train_waiting_durations).sum
    end

    def cheapest_price
      connections.sum { |connection| connection.cheapest_fare.price }
    end

    private

    def connections
      self
    end
  end
end
