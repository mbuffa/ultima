module Ultima
  module World
    class Camera
      attr_accessor :direction, :location

      def initialize(direction = :north, coords = [0, 0])
        @direction = direction
        @location = Location.new(*coords)
      end

      def strafe_left!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:left]
        @location = @location + DIRECTION_TO_MOVE[direction]
      end

      def turn_left!
        idx = DIRECTIONS.find_index(@direction) - 1
        idx = DIRECTIONS.size - 1 if idx < 0
        @direction = DIRECTIONS[idx]
      end

      def forward!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:front]
        @location = @location + DIRECTION_TO_MOVE[direction]
      end

      def turn_right!
        idx = DIRECTIONS.find_index(@direction) + 1
        idx = 0 if idx > DIRECTIONS.size - 1
        @direction = DIRECTIONS[idx]
      end

      def strafe_right!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:right]
        @location = @location + DIRECTION_TO_MOVE[direction]
      end

      def backward!
        inverse = INVERSE_DIRECTION[@direction]
        @location = @location + DIRECTION_TO_MOVE[direction]
      end
    end
  end
end
