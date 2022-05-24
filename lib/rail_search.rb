# frozen_string_literal: true

require 'rexml'

require_relative 'utils/time_utils.rb'
require_relative 'rail_search/connection'
require_relative 'rail_search/connections'
require_relative 'rail_search/fare'
require_relative 'rail_search/fares'
require_relative 'rail_search/result'
require_relative 'rail_search/results'

module RailSearch
  include REXML

  def parse(raw_xml)
    xml = Document.new(raw_xml)

    Results.new(xml.get_elements('//SearchResult'))
  end

  module_function :parse
end
