module Ultima
  module States
    class Play < Abstract
      def initialize(game)
        @game = game
        @grid = World::Grid.new
        @camera = World::Camera.new(@grid)

        @view = Views::Play.new(@game.window, @grid, @camera)
        @limiter = Core::Limiter.new(Core::Rules::ACTIONS_LIMIT)
      end

      def draw
        @view.draw
      end

      def update
        return if !@limiter.may_act?

        @view.update

        if Gosu::button_down?(Gosu::KbNumpad4)
          @camera.strafe_left!
          action_taken!
        elsif Gosu::button_down?(Gosu::KbNumpad7)
          @camera.turn_left!
          action_taken!
        elsif Gosu::button_down?(Gosu::KbNumpad8)
          @camera.forward!
          action_taken!
        elsif Gosu::button_down?(Gosu::KbNumpad9)
          @camera.turn_right!
          action_taken!
        elsif Gosu::button_down?(Gosu::KbNumpad6)
          @camera.strafe_right!
          action_taken!
        elsif Gosu::button_down?(Gosu::KbNumpad5)
          @camera.backward!
          action_taken!
        end
      end

      def enter
        @limiter.reset!
        @view.scene.fetch_partial
      end

      def leave
      end

      private

      def action_taken!
        @limiter.act!
        @view.scene.fetch_partial
      end
    end
  end
end
