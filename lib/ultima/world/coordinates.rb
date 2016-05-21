module Ultima
  module World
    class Coordinates < Array
      extend Util::Hinting

      def initialize(x, z)
        super(2)
        self[0] = x
        self[1] = z
      end
      hint_method(:initialize, [Fixnum, Fixnum])

      def +(other)
        raise ArgumentError, 'Must have the same size' if other.size != size
        map.with_index { |x, i| x + other[i] }
      end
    end
  end
end
