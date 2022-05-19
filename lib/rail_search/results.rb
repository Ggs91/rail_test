# frozen_string_literal: true

module RailSearch
  class Results < Array
    def initialize(raw_results)
      raw_results.each { |raw_result| self << Result.new(raw_result) }
    end

    def inspect
      self.map(&:inspect)
    end
  end
end
