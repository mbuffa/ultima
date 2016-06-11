module Ultima
  module World
    class Grid
      attr_reader :tiles

      def initialize
        @tiles = {}

        # TODO: Add support for loading maps from Grid Cartographer XML exports.
        build_placeholder
      end

      # Displays current scene (occupied tile + front, sides two levels deep),
      #   like this:
      #
      #    ..
      #    X..    where X is the player and dots are tiles.
      #    ..
      #
      # Returns a new array of Tiles with coordinates relative to the camera.
      def first_person(camera_location, camera_direction)
        neighbor_directions = DIRECTION_TO_NEIGHBOR_MOVE[camera_direction]

        tiles = { current: @tiles[camera_location] }

        [:front, :front2, :right, :rcorner, :left, :lcorner].each do |ntype|
          nlocation = neighbor_location(camera_location,
                                        neighbor_directions[ntype])
          ntile = @tiles[nlocation]

          next if ntile.nil?

          tiles[ntype] = ntile
        end

        tiles
      end

      ##
      # Displays a complete map and a minimap.
      def map(focus_coords = nil, radius = nil)
      end

      protected

      def build_placeholder
        [[0, 0], [1, 0], [1, 1], [1, -1]].each do |coords|
          location = Location.new(*coords)
          @tiles[location] = Tile.new(location)
        end
        build_borders_edges
      end

      def build_borders_edges(edge_type = Tile::EDGE_TYPES[:wall])
        @tiles.each do |location, tile|
          DIRECTIONS.each do |direction|
            neighbor = @tiles[location + DIRECTION_TO_MOVE[direction]]

            if neighbor.nil? || neighbor.edges[ INVERSE_DIRECTION[direction] ] == Tile::EDGE_TYPES[:wall]
              puts "Adding wall to #{location} to the #{direction}"
              tile.edges[direction] = Tile::EDGE_TYPES[:wall]
            end
          end
        end
      end

      def neighbor_location(current_location, directions)
        directions = Array(directions)

        directions.each do |direction|
          current_location = current_location + DIRECTION_TO_MOVE[direction]
        end
        current_location
      end
    end
  end
end
