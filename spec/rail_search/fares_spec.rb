# frozen_string_literal: true

RSpec.describe RailSearch::Fares do
  include_context 'init XML response'

  subject { described_class.new(raw_fares) }

  let(:raw_fares) { xml.get_elements('//SearchResult')[0].get_elements('//Connections')[0].get_elements('//Fares')[0] }

  it { expect(subject.count).to eq(raw_fares.elements.count) }

  it { is_expected.to all(be_an_instance_of(RailSearch::Fare)) }
end
