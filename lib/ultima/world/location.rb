module Ultima
  module World
    class Location < Array
      extend Util::Hinting

      def initialize(x, z)
        super(2)
        self[0] = x
        self[1] = z
        freeze
      end
      hint_method(:initialize, [Fixnum, Fixnum])

      def +(other)
        raise ArgumentError, 'Must have the same size' if other.size != size
        new_coordinates = map.with_index { |x, i| x + other[i] }
        Location.new(*new_coordinates)
      end

      def -(other)
        raise ArgumentError, 'Must have the same size' if other.size != size
        new_coordinates = map.with_index { |x, i| x - other[i] }
        Location.new(*new_coordinates)
      end
    end
  end
end
