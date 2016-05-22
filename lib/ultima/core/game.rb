module Ultima
  module Core
    class Game
      attr_reader :window, :singer

      def initialize(window)
        @window = window
        @singer = Singer.new
        @states = {
          intro: States::Intro.new(self),
          menu: States::Menu.new(self),
          play: States::Play.new(self)
        }
        @current = :intro

        @states[@current].enter
      end

      def update
        @window.close if Gosu.button_down?(Gosu::KbEscape)

        @states[@current].update
      end

      def draw
        @states[@current].draw
      end

      def switch_state(state_symbol)
        # TODO: error check.
        @states[@current].leave
        @states[state_symbol].enter
        @current = state_symbol
      end
    end
  end
end
