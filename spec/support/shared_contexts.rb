# frozen_string_literal: true

RSpec.shared_context 'init XML response', :shared_context => :metadata do
  let(:response) { File.read('spec/fixtures/search.xml').to_s }

  let(:xml) { REXML::Document.new(response) }
end
