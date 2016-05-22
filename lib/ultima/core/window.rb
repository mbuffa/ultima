require 'json'

module Ultima
  module Core
    class Window < Gosu::Window
      def initialize
        file = File.read('data/settings.json')
        settings = JSON.parse(file)

        width = settings.dig('window', 'width') || 800
        height = settings.dig('window', 'height') || 600

        super(width, height, settings.dig('window', 'fullscreen') || false)
        # TODO: replace this with some I18n.
        self.caption = settings.dig('window', 'title')

        @game = Game.new(self)
      end

      def update
        @game.update
      end

      def draw
        @game.draw
      end

      def needs_cursor?
        true
      end
    end
  end
end
