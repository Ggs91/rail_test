# frozen_string_literal: true

RSpec.describe RailSearch::Result do
  include_context 'init XML response'

  subject { described_class.new(raw_result) }

  let(:raw_result) { xml.get_elements('//SearchResult')[0] }
  let(:raw_connections) { raw_result.get_elements('//Connections')[0] }

  describe '#id' do
    it { expect(subject.id).to eq(raw_result.elements['ID'].text) }
  end

  describe '#connectionss' do
    it { expect(subject.connections).to all(be_an_instance_of(RailSearch::Connection)) }

    it { expect(subject.connections.count).to eq(raw_result.get_elements('//Connections')[0].elements.count) }
  end

  describe '#cheapest_price' do
    it 'retruns the cheapest price available for the given result' do

      cheapest_prices_per_connection = {}

      raw_connections.each_element do |raw_connection|
        connection = raw_connection.elements['TrainName'].text

        raw_connection.elements['Fares'].each_element do |raw_fare|
          price = raw_fare.elements['Price/Value'].text.to_f

          cheapest_prices_per_connection[connection] = price if
            cheapest_prices_per_connection[connection].nil? || cheapest_prices_per_connection[connection] > price
        end
      end

      cheapest_price = cheapest_prices_per_connection.values.sum

      expect(subject.cheapest_price).to eq(cheapest_price)
    end
  end

  describe '#total_duration' do
    it 'retruns duration of the whole journey for the given result' do
      journey_duration_slots = []

      raw_connections.each_element do |raw_connection|
        connection_duration =
          Utils::TimeUtils.duration_in_seconds_between(
            raw_connection.get_elements('DepartureTime')[0].text,
            raw_connection.get_elements('ArrivalTime')[0].text
          )

        journey_duration_slots << connection_duration

        unless raw_connection.next_element.nil?
          waiting_duration =
            Utils::TimeUtils.duration_in_seconds_between(
              raw_connection.get_elements('ArrivalTime')[0].text,
              raw_connection.next_element.get_elements('DepartureTime')[0].text
            )

          journey_duration_slots << waiting_duration
        end
      end

      expect(subject.total_duration).to eq(journey_duration_slots.sum)
    end
  end
end
