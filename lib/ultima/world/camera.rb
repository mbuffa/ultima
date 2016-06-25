module Ultima
  module World
    class Camera
      include Util::Hooks

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
        move_to(@location + DIRECTION_TO_MOVE[direction])
      end

      def turn_left!
        @direction = Directions::left_of(@direction)
      end

      def forward!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:front]
        move_to(@location + DIRECTION_TO_MOVE[direction])
      end

      def turn_right!
        @direction = Directions::right_of(@direction)
      end

      def strafe_right!
        direction = DIRECTION_TO_NEIGHBOR_MOVE[@direction][:right]
        move_to(@location + DIRECTION_TO_MOVE[direction])
      end

      def backward!
        inverse = INVERSE_DIRECTION[@direction]
        move_to(@location + DIRECTION_TO_MOVE[inverse])
      end

      protected

      def move_to(new_location)
        return false if !@grid.can_move?(to: new_location, from: @location)
        @location = new_location
      end
    end
  end
end
