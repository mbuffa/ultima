module Ultima
  module World
    class Grid
      extend Util::Hinting

      def initialize
        @tiles = {}
        @entities = Hash.new([])

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

      def entities_in(location)
        return @entities[location]
      end
      hint_method(:entities_in, [Location])

      def can_move?(locations)
        to = locations[:to]
        from = locations[:from]
        direction = DIRECTION_TO_MOVE.key(to - from)
        obstacle = entities_on_edge_in(from, direction)
        invert_obstacle = entities_on_edge_in(to, INVERSE_DIRECTION[direction])

        return !@tiles[to].nil? &&
               @tiles[to].free? &&
               (@tiles[from].edges[direction].nil? ||
                (obstacle && obstacle.open?) ||
                (invert_obstacle && invert_obstacle.open?))
      end

      protected

      def entities_on_edge_in(location, direction)
        entities_in(location).select { |obj| obj.direction == direction }.first
      end

      def build_placeholder
        # Walls
        [[0, 0], [1, 0], [1, 1], [1, -1]].each do |coords|
          location = Location.new(*coords)
          @tiles[location] = Tile.new(location)
        end

        # Entities
        entities = [
          { type: Tile::EDGE_TYPES[:door], coords: [0, 0], direction: :east }
        ]

        entities.each do |obj|
          location = Location.new(*obj[:coords])

          if obj[:type] == Tile::EDGE_TYPES[:door]
            @entities[location] << Entities::Door.new(location, obj[:direction])
            @tiles[location].edges[obj[:direction]] = Tile::EDGE_TYPES[:door]

            # Place a edge type door on the other side as well :)
            twin_location = location + DIRECTION_TO_MOVE[obj[:direction]]
            twin_direction = INVERSE_DIRECTION[obj[:direction]]

            @tiles[twin_location].edges[twin_direction] = Tile::EDGE_TYPES[:door]
          end
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
