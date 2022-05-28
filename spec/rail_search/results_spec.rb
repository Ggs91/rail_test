# frozen_string_literal: true

RSpec.describe RailSearch::Results do
  subject { described_class.new(raw_results) }

  response = File.read('spec/fixtures/search.xml').to_s

  xml = REXML::Document.new(response)

  let(:raw_results) { xml.get_elements('//SearchResult') }

  it { expect(subject.count).to eq(raw_results.count) }

  it { is_expected.to all(be_an_instance_of(RailSearch::Result)) }
end
