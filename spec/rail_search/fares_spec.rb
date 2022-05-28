# frozen_string_literal: true

RSpec.describe RailSearch::Fares do
  subject { described_class.new(raw_fares) }

  response = File.read('spec/fixtures/search.xml').to_s

  xml = REXML::Document.new(response)

  let(:raw_fares) { xml.get_elements('//SearchResult')[0].get_elements('//Connections')[0].get_elements('//Fares')[0] }

  it { expect(subject.count).to eq(raw_fares.elements.count) }

  it { is_expected.to all(be_an_instance_of(RailSearch::Fare)) }
end
