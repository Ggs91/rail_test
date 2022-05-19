# frozen_string_literal: true

module RailSearch
  class Result
    attr :id, :connections

    def initialize(raw_result)
      elements = raw_result.elements

      @id = elements['ID'].text
      @connections = Connections.new(elements['Connections'])
      
      # TODO: @duration, 
    end

    def inspect
      { id: @id, connections: @connections.inspect }
    end
  end
end
