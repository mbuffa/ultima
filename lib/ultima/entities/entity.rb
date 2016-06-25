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

      def initialize(location, direction, type)
        @location = location
        @direction = direction
        @type = type
      end
      hint_method(:initialize, [World::Location, Symbol, Symbol])
    end
  end
end


