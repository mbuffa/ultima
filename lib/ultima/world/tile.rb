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
        wall: :wall
      }.freeze

      attr_accessor :coords, :type, :edges, :meta

      def initialize(coords, type: GROUD_TYPES[:free], edges: [], meta: {})
        @coords = coords
        @type = type
        @edges = edges
        @meta = meta
      end
    end
  end
end
