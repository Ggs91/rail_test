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

      @id          = elements['ID'].text
      @connections = Connections.new(elements['Connections'])
    end
  end
end
