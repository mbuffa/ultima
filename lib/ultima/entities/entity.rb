module Ultima
  module Entities
    TYPES = {
      item: :item,
      door: :door,
      mechanism: :mechanism
    }.freeze

    class Entity
      extend Util::Hinting

      attr_reader :direction, :type

      def initialize(location, direction, type, twin = nil)
        @location = location
        @direction = direction
        @type = type
        @twin = twin
      end
      hint_method(:initialize, [World::Location, Symbol, Symbol])

      def twin=(entity)
        @twin = entity
      end
    end
  end
end


