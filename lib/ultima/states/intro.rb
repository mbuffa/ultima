module Ultima
  module States
    class Intro < Abstract
      def initialize(game)
        @game = game

        x = @game.window.width / 2
        y = @game.window.height / 2
        z = 0

        @title = UI::Label.new([x, y, z],
                               'Maxime Buffa presents...',
                               line_height: 36,
                               fadein: true,
                               color: Gosu::Color::CYAN)

        @elapsed = Gosu.milliseconds
      end

      def draw
        @title.draw
      end

      def update
        @title.update
        @title.fadeout! if Gosu.milliseconds - @elapsed > 5_000
        @game.switch_state(:menu) if Gosu.milliseconds - @elapsed > 10_000 ||
                                     Gosu.button_down?(Gosu::KbSpace)
      end

      def enter
        @game.singer.play(:intro)
        @title.fadein!
      end

      def leave
      end
    end
  end
end
