module Ultima
  module States
    class Menu < Abstract
      def initialize(game)
        @game = game

        # TODO: Export this to a 'view' class.
        @title = Widgets::Label.new('Ultima', 128, fadein: true, color: Gosu::Color::RED)
        @quit_btn = Widgets::Button.new('Quit', 24, fadein: true, color: Gosu::Color::GRAY) do
          @game.window.close
        end
        @quit_btn_position = [@game.window.width / 2, @game.window.height / 2, 0]
      end

      def draw
        # TODO: Export this to a 'view' class.
        x = (@game.window.width / 2) - (@title.width / 2)
        y = (@game.window.height / 5) - (@title.height / 2)
        z = 0
        @title.draw(x, y, z)

        @quit_btn.draw(*@quit_btn_position)
      end

      def update
        @title.update
        @quit_btn.update

        # TODO: Export this to a 'view' class.
        quit_btn_width = Range.new(@quit_btn_position.first, @quit_btn_position.first + @quit_btn.width)
        quit_btn_height = Range.new(@quit_btn_position[1], @quit_btn_position[1] + @quit_btn.height)

        if Gosu.button_down?(Gosu::MsLeft) &&
           quit_btn_width.cover?(@game.window.mouse_x.to_i) &&
           quit_btn_height.cover?(@game.window.mouse_y.to_i)
          @quit_btn.click!
        end
      end

      def enter
        # @title.fadein!
      end

      def leave
        # @title.fadeout!
      end
    end
  end
end
