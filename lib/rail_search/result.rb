# frozen_string_literal: true

module RailSearch
  class Result
    attr :id

    def initialize(raw_result)
      elements = raw_result.elements

      @id = elements['ID']
    end

    def inspect 
      { id: @id }
    end
  end
end
