module Ultima
  module World
    DIRECTIONS = [
      :north,
      :east,
      :south,
      :west
    ].freeze

    class Grid
      DIRECTION_TO_MOVE = {
        north: Coordinates.new(0, 1),
        east: Coordinates.new(1, 0),
        south: Coordinates.new(0, -1),
        west: Coordinates.new(-1, 0)
      }.freeze

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

      def initialize(_filename = nil)
        # TODO: Add support for loading maps from Grid Cartographer XML exports.
        @tiles = {}

        [[0, 0], [1, 0], [1, 1], [1, -1]].each do |coords|
          @tiles[coords] = Tile.new(coords)
        end
      end

      # Displays current scene (occupied tile + front, sides two levels deep),
      #   like this:
      #
      #    ..
      #    X..    where X is the player and dots are tiles.
      #    ..
      #
      # Returns a new array of Tiles with coordinates relative to the camera.
      def first_person_view(camera_coords, camera_direction)
      end

      ##
      # Displays a complete map and a minimap.
      def map(focus_coords = nil, radius = nil)
      end

      protected

      ##
      # Automatically assigns walls.
      def build_border_edges(edge_type = EDGE_TYPES[:wall])
        # TODO: Iterate through tiles, query for neighbor tiles,
        #       and assign a wall on each direction that is not linked.
      end
    end
  end
end
