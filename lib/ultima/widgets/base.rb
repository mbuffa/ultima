module Ultima
  module Widgets
    class Base
      extend Ultima::Util::Abstract

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

      abstract_methods(:draw, :update)
    end
  end
end
