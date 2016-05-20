module Ultima
  module Widgets
    class Label < Base
      prepend Fading

      def initialize(text, line_height, options = {})
        # TODO: use a font parameter.
        super Gosu::Image.from_text(text, line_height, font: 'URW Gothic')
        @color = options[:color] || Gosu::Color::WHITE
        initialize_fading(options)
      end

      def draw(x, y, z, scale_x = 1, scale_y = 1, color = nil)
        @image.draw(x, y, z, scale_x, scale_y, color || @color)
      end

      def update
      end
    end
  end
end
