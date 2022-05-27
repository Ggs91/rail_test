# frozen_string_literal: true

require 'forwardable'

module RailSearch
  class Result
    extend Forwardable

    attr :id, :connections

    def_delegator :@connections, :cheapest_price
    def_delegator :@connections, :total_duration

    def initialize(raw_result)
      elements = raw_result.elements

      @id = elements['ID'].text
      @connections = Connections.new(elements['Connections'])
    end

    def inspect
      {
        id: @id,
        connections: {
          connections: @connections.inspect,
          train_changes: train_changes,
          total_duration: @connections.total_duration
        }
      }
    end

    private

    def train_changes
      {
        count: @connections.train_changes_count,
        waiting_durations: @connections.format_train_waiting_durations
      }
    end
  end
end
