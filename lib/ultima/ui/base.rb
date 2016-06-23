module Ultima
  module UI
    class Base
      extend Util::Abstract

      def initialize(position, image)
        # TODO: Handle scaling/size target as well.
        @x, @y, @z = position
        @image = image
      end

      def width
        @image.width
      end

      def height
        @image.height
      end

      def in?(x = 0, y = 0, z = 0)
        return false if @z != z
        ((@x)..(@x + width)).cover?(x) && ((@y)..(@y + height)).cover?(y)
      end

      abstract_methods(:draw, :update)
    end
  end
end
