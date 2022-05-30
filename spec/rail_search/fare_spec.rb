# frozen_string_literal: true

RSpec.describe RailSearch::Fare do
  include_context 'init XML response'

  subject { described_class.new(raw_fare) }

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
