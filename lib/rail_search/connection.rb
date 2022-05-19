# frozen_string_literal: true

module RailSearch
  class Connection
    attr :start, :finish, :departure_time, :arrival_time

    def initialize(raw_connection)
      elements = raw_connection.elements

      @start          = elements['Start'].text
      @finish         = elements['Finish'].text
      @departure_time = elements['DepartureTime'].text
      @arrival_time   = elements['ArrivalTime'].text
      # TODO: @duration, @train_name
      # TODO: RailSearch::Fares => [RailSearch::Fare, ...]
    end

    def inspect
      { start: @start, finish: @finish, departure_time: @departure_time, arrival_time: @arrival_time }
    end
  end
end
