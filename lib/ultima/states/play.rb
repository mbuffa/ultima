module Ultima
  module States
    class Play < Abstract
      def initialize(game)
        @game = game
        @grid = Ultima::World::Grid.new
        # FIXME: Replace with dynamic values.
        @scene = Ultima::World::Scene.new(400, 50, 800, 600)
        @camera = Ultima::World::Camera.new(@grid)
      end

      def draw
        @scene.draw(@camera)
      end

      def update
        return if action_taken?

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
        @action_taken_at = nil

        update_scene
      end

      def leave
      end

      private

      def action_taken?
        return false if @action_taken_at.nil?
        Gosu::milliseconds - @action_taken_at < Core::Rules::ACTIONS_LIMIT
      end

      def action_taken!
        @action_taken_at = Gosu::milliseconds
        update_scene
      end

      def update_scene
        @scene.update(@grid, @camera)
      end
    end
  end
end
