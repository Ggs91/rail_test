# frozen_string_literal: true

require 'rexml'

# Tools
require_relative 'utils/time_utils.rb'

# Models & Associations
require_relative 'rail_search/connection'
require_relative 'rail_search/connections'
require_relative 'rail_search/fare'
require_relative 'rail_search/fares'
require_relative 'rail_search/result'
require_relative 'rail_search/results'

# Decorators
require_relative 'rail_search/decorators/base_decorator.rb'
require_relative 'rail_search/decorators/connection_decorator.rb'
require_relative 'rail_search/decorators/result_decorator.rb'
require_relative 'rail_search/decorators/results_decorator.rb'

# Serializers
require_relative 'rail_search/serializers/base_serializer.rb'
require_relative 'rail_search/serializers/connection_serializer.rb'
require_relative 'rail_search/serializers/connections_serializer.rb'
require_relative 'rail_search/serializers/fare_serializer.rb'
require_relative 'rail_search/serializers/fares_serializer.rb'
require_relative 'rail_search/serializers/result_serializer.rb'
require_relative 'rail_search/serializers/results_serializer.rb'

module RailSearch
  include REXML

  def parse(raw_xml)
    xml = Document.new(raw_xml)

    Results.new(xml.get_elements('//SearchResult'))
  end

  module_function :parse
end
