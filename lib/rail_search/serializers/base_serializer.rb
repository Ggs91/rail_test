# frozen_string_literal: true

module RailSearch
  module Serializers
    class BaseSerializer
      def self.serialize(...)
        new(...).serialize
      end

      def initialize(...)
        raise NotImplementedError, 'Must be implemented'
      end

      def serialize(...)
        raise NotImplementedError, 'Must be implemented'
      end
    end
  end
end
