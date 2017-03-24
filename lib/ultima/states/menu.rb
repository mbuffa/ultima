module Ultima
  module States
    class Menu < Abstract
      def initialize(game)
        @game = game

        x = @game.window.width / 2
        y = @game.window.height / 5
        z = 0

        # TODO: Export this to a 'view' class.
        @title = UI::Label.new([x, y, z],
                               'Ultima',
                               line_height: 128,
                               fadein: true,
                               color: Gosu::Color::RED)

        @play_btn_position = [@game.window.width / 2, (@game.window.height / 2) - 48, 0]
        @play_btn = UI::Button.new(@play_btn_position,
                                   'Play',
                                   line_height: 24,
                                   fadein: true,
                                   color: Gosu::Color::GRAY) do
          @game.switch_state(:play)
        end

        @quit_btn_position = [@game.window.width / 2, @game.window.height / 2, 0]
        @quit_btn = UI::Button.new(@quit_btn_position,
                                   'Quit',
                                   line_height: 24,
                                   fadein: true,
                                   color: Gosu::Color::GRAY) do
          @game.window.close
        end
      end

      def draw
        # TODO: Export this to a 'view' class.
        @title.draw
        @play_btn.draw
        @quit_btn.draw
      end

      def update
        @title.update
        @play_btn.update
        @quit_btn.update

        # TODO: Export this to a 'view' class.
        play_btn_width = Range.new(@play_btn_position.first, @play_btn_position.first + @play_btn.width)
        play_btn_height = Range.new(@play_btn_position[1], @play_btn_position[1] + @play_btn.height)

        if Gosu.button_down?(Gosu::MsLeft) &&
           play_btn_width.cover?(@game.window.mouse_x.to_i) &&
           play_btn_height.cover?(@game.window.mouse_y.to_i)
          @play_btn.click!
        end

        quit_btn_width = Range.new(@quit_btn_position.first, @quit_btn_position.first + @quit_btn.width)
        quit_btn_height = Range.new(@quit_btn_position[1], @quit_btn_position[1] + @quit_btn.height)

        if Gosu.button_down?(Gosu::MsLeft) &&
           quit_btn_width.cover?(@game.window.mouse_x.to_i) &&
           quit_btn_height.cover?(@game.window.mouse_y.to_i)
          @quit_btn.click!
        end
      end

      def enter
      end

      def leave
      end
    end
  end
end
