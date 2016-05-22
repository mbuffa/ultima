module Ultima
  module Widgets
    module Fading
      def initialize_fading(options)
        # TODO: Find a way to handle any color.
        @color = Gosu::Color.argb(Core::Colors::INVISIBLE_WHITE) if options[:fadein]

        @elapsed_time = 0
        @fade = 0
        @fade_steps = 100

        fadeout! if options[:fadeout]
        fadein! if options[:fadein]
      end

      def fadein!
        @fade = 2
      end

      def fadeout!
        @fade = -2
      end

      def update
        return if @fade == 0

        @elapsed_time = Gosu.milliseconds

        if @elapsed_time >= @fade_steps && (0..255).cover?(@color.alpha + @fade)
          @color = Gosu::Color.argb(@color.alpha + @fade,
                                    @color.red,
                                    @color.green,
                                    @color.blue)
          @elapsed_time = 0
        end
      end
    end
  end
end
