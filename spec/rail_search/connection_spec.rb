# frozen_string_literal: true

RSpec.describe RailSearch::Connection do
  include_context 'init XML response'

  subject { described_class.new(raw_connection) }

  response = File.read('spec/fixtures/search.xml').to_s

  xml = REXML::Document.new(response)

  let(:raw_search_result) { xml.get_elements('//SearchResult')[0].get_elements('//Connections') }
  let(:raw_connection) { raw_search_result[0].get_elements('//Connection')[0] }
  let(:raw_fares) { raw_search_result[0].get_elements('//Fares')[0] }

  describe '#start' do
    it { expect(subject.start).to eq(raw_connection.elements['Start'].text) }
  end

  describe '#finish' do
    it { expect(subject.finish).to eq(raw_connection.elements['Finish'].text) }
  end

  describe '#departure_time' do
    it { expect(subject.departure_time).to eq(raw_connection.elements['DepartureTime'].text) }
  end

  describe '#arrival_time' do
    it { expect(subject.arrival_time).to eq(raw_connection.elements['ArrivalTime'].text) }
  end

  describe '#train_name' do
    it { expect(subject.train_name).to eq(raw_connection.elements['TrainName'].text) }
  end

  describe '#fares' do
    it { expect(subject.fares).to all(be_an_instance_of(RailSearch::Fare)) }

    it "is set to the connection's fares" do
      connection_fares_names = []
      connection_fares_currencies = []
      connection_fares_prices = []

      raw_fares.each_element do |raw_fare|
        connection_fares_names << raw_fare.elements['Name'].text
        connection_fares_currencies << raw_fare.elements['Price/Currency'].text
        connection_fares_prices << raw_fare.elements['Price/Value'].text.to_f
      end

      expect(subject.fares.map { |fare| fare.name }).to eq(connection_fares_names)
      expect(subject.fares.map { |fare| fare.currency }).to eq(connection_fares_currencies)
      expect(subject.fares.map { |fare| fare.price }).to eq(connection_fares_prices)
    end
  end

  describe '#duration' do
    let(:departure_time) { raw_connection.elements['DepartureTime'].text }
    let(:arrival_time) { raw_connection.elements['ArrivalTime'].text }

    it 'set to the connection duration' do
       expect(subject.duration).to eq(Utils::TimeUtils.duration_in_seconds_between(departure_time, arrival_time))
    end
  end
end
