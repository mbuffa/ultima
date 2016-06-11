module Ultima
  module World
    class Camera
      include Ultima::Util::Hooks

      attr_accessor :direction, :location

      after [:strafe_left!, :turn_left!, :forward!, :turn_right!,
             :strafe_right!, :backward!] do
        puts "Now on #{@location} heading #{@direction}"
      end

      def initialize(grid, direction = :north, coords = [0, 0])
        @grid = grid
        @direction = direction
        @location = Location.new(*coords)
      end

      def strafe_left!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:left]
        nlocation = @location + DIRECTION_TO_MOVE[direction]
        return if !@grid.tiles[nlocation] || !@grid.tiles[nlocation].free?
        @location = nlocation
      end

      def turn_left!
        @direction = Directions::left_of(@direction)
      end

      def forward!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:front]
        nlocation = @location + DIRECTION_TO_MOVE[direction]
        return if !@grid.tiles[nlocation] || !@grid.tiles[nlocation].free?
        @location = nlocation
      end

      def turn_right!
        @direction = Directions::right_of(@direction)
      end

      def strafe_right!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:right]
        nlocation = @location + DIRECTION_TO_MOVE[direction]
        return if !@grid.tiles[nlocation] || !@grid.tiles[nlocation].free?
        @location = nlocation
      end

      def backward!
        inverse = INVERSE_DIRECTION[@direction]
        nlocation = @location + DIRECTION_TO_MOVE[inverse]
        return if !@grid.tiles[nlocation] || !@grid.tiles[nlocation].free?
        @location = nlocation
      end
    end
  end
end
