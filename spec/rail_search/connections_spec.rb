# frozen_string_literal: true

RSpec.describe RailSearch::Connections do
  subject { described_class.new(raw_connections) }

  response = File.read('spec/fixtures/search.xml').to_s

  xml = REXML::Document.new(response)

  let(:raw_connections) { xml.get_elements('//SearchResult')[0].get_elements('//Connections')[0] }

  it { expect(subject.count).to eq(raw_connections.elements.count) }

  it { is_expected.to all(be_an_instance_of(RailSearch::Connection)) }

  describe '#train_changes_count' do
    it { expect(subject.train_changes_count).to eq(raw_connections.elements.count - 1) }
  end
end
