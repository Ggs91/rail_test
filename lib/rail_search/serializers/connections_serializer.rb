# frozen_string_literal: true

module RailSearch
  module Serializers
    class ConnectionsSerializer < BaseSerializer
      def initialize(_connections)
        @connections = _connections.map { |connection| ConnectionSerializer.serialize(connection) }
      end

      def serialize
        @connections
      end
    end
  end
end


