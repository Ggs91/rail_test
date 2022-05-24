# frozen_string_literal: true

require_relative 'lib/rail_search.rb'

response = File.read('lib/data/search.xml').to_s

p RailSearch.parse(response)
