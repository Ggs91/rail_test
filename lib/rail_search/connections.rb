# frozen_string_literal: true

module RailSearch
  class Connections < Array
    def initialize(raw_connections)
      raw_connections.each_element { |raw_connection| self << Connection.new(raw_connection) }
      # TODO: @train_changes_count, @train_changes (delay between each train change)
    end

    def inspect
      self.map(&:inspect)
    end
  end
end
