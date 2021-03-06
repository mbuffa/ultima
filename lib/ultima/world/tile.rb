module Ultima
  module World
    class Tile
      GROUD_TYPES = {
        free: nil,
        liquid: :liquid,
        block: :block
      }.freeze

      EDGE_TYPES = {
        none: nil,
        wall: :wall,
        door: :door
      }.freeze

      attr_accessor :location, :type, :edges, :meta

      def initialize(location, type: GROUD_TYPES[:free], edges: {}, meta: {})
        @location = location
        @type = type
        @edges = edges
        @meta = meta
      end

      def free?
        @type == GROUD_TYPES[:free]
      end
    end
  end
end
