# frozen_string_literal: true

RSpec.describe RailSearch::Results do
  include_context 'init XML response'

  subject { described_class.new(raw_results) }

  let(:raw_results) { xml.get_elements('//SearchResult') }

  it { expect(subject.count).to eq(raw_results.count) }

  it { is_expected.to all(be_an_instance_of(RailSearch::Result)) }
end
