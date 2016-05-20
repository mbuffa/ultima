module Ultima
  module Widgets
    class Base
      attr_reader :image

      def initialize(image)
        @image = image
      end

      def width
        @image.width
      end

      def height
        @image.height
      end

      def draw
        not_implemented
      end

      def update
        not_implemented
      end

      private

      def not_implemented
        message = "You need to implement ##{caller_locations(1, 1)[0].label}."
        raise NoMethodError.new, message
      end
    end
  end
end
