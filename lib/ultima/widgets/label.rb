module Ultima
  module Widgets
    class Label < Base
      prepend Fading

      def initialize(position, text, options = {})
        # TODO: use a font parameter.
        image = Gosu::Image.from_text(text,
                                      options[:line_height],
                                      font: 'URW Gothic')
        unless options[:no_recenter]
          position[0] -= image.width / 2
          position[1] -= image.height / 2
        end
        super(position, image)
        @color = options[:color] || Gosu::Color::WHITE
        initialize_fading(options)
      end

      def draw
        scale_x, scale_y = [1, 1]
        @image.draw(@x, @y, @z, scale_x, scale_y, @color)
      end

      def update
      end
    end
  end
end
