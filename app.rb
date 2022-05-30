# frozen_string_literal: true

require_relative 'lib/rail_search.rb'

response = File.read('lib/data/search.xml').to_s

results = RailSearch.parse(response)

pp RailSearch::Serializers::ResultsSerializer.serialize(results)
