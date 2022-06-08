# frozen_string_literal: true

require 'forwardable'

module RailSearch
  class Connection
    extend Forwardable

    def_delegator :@fares, :cheapest, :cheapest_fare

    attr :start, :finish, :departure_time, :arrival_time, :train_name, :fares, :duration


    def initialize(raw_connection)
      connection_elements = raw_connection.elements

      @start          = connection_elements['Start'].text
      @finish         = connection_elements['Finish'].text
      @departure_time = connection_elements['DepartureTime'].text
      @arrival_time   = connection_elements['ArrivalTime'].text
      @train_name     = connection_elements['TrainName'].text
      @fares          = Fares.new(connection_elements['Fares'])
      @duration       = Utils::TimeUtils.duration_in_seconds_between(@departure_time, @arrival_time)
    end
  end
end
