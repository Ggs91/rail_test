# frozen_string_literal: true

require 'rexml'

RSpec.describe RailSearch::Fare do
  subject { described_class.new(raw_fare) }

  response = File.read('spec/fixtures/search.xml').to_s

  xml = REXML::Document.new(response)

  let(:raw_fare) { xml.get_elements('//SearchResult')[0].get_elements('//Connections')[0].get_elements('//Fares')[0].get_elements('//Fare')[0] }

  describe '#name' do
    it { expect(subject.name).to eq(raw_fare.elements['Name'].text) }
  end

  describe '#currency' do
    it { expect(subject.currency).to eq(raw_fare.elements['Price/Currency'].text) }
  end

  describe '#price' do
    it { expect(subject.price).to eq(raw_fare.elements['Price/Value'].text.to_f) }
  end
end
