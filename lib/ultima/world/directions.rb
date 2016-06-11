module Ultima
  module World
    module Directions
      def self.left_of(direction)
        idx = DIRECTIONS.find_index(direction) - 1
        idx = DIRECTIONS.size - 1 if idx < 0
        DIRECTIONS[idx]
      end

      def self.right_of(direction)
        idx = DIRECTIONS.find_index(direction) + 1
        idx = 0 if idx > DIRECTIONS.size - 1
        DIRECTIONS[idx]
      end
    end

    DIRECTIONS = [:north, :east, :south, :west].freeze

    DIRECTION_TO_MOVE = {
      north: Location.new(0, 1),
      east: Location.new(1, 0),
      south: Location.new(0, -1),
      west: Location.new(-1, 0)
    }.freeze

    INVERSE_DIRECTION = {
      north: :south,
      east: :west,
      south: :north,
      west: :east
    }.freeze

    # TODO: Find a smart replacement for this (enums + array rotation?).
    DIRECTION_TO_NEIGHBOR_MOVE = {
      north: {
        front: :north,
        front2: [:north, :north],
        right: :east,
        rcorner: [:north, :east],
        left: :west,
        lcorner: [:north, :west]
      },
      east: {
        front: :east,
        front2: [:east, :east],
        right: :south,
        rcorner: [:east, :south],
        left: :north,
        lcorner: [:east, :north]
      },
      south: {
        front: :south,
        front2: [:south, :south],
        right: :west,
        rcorner: [:south, :west],
        left: :east,
        lcorner: [:south, :east]
      },
      west: {
        front: :west,
        front2: [:west, :west],
        right: :north,
        rcorner: [:north, :west],
        left: :south,
        lcorner: [:south, :west]
      }
    }.freeze
  end
end
