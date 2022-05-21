# frozen_string_literal: true

module RailSearch
  class Connection
    attr :start, :finish, :departure_time, :arrival_time, :train_name

    def initialize(raw_connection)
      connection_elements = raw_connection.elements

      @start          = connection_elements['Start'].text
      @finish         = connection_elements['Finish'].text
      @departure_time = connection_elements['DepartureTime'].text
      @arrival_time   = connection_elements['ArrivalTime'].text
      @train_name   = connection_elements['TrainName'].text
      @fares          = Fares.new(connection_elements['Fares'])
      # TODO: @duration
    end

    def inspect
      { start: @start, finish: @finish, departure_time: @departure_time, arrival_time: @arrival_time, train_name: @train_name, fares: @fares }
    end
  end
end
