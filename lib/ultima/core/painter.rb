module Ultima
  module Core
    class Painter
      def initialize
        @sprites = {}

        Dir.glob('data/sprites/*.png').each do |path|
          @sprites[File.basename(path, '.*').to_sym] = Gosu::Image.new(path)
        end
      end

      def sprite(name)
        @sprites[name]
      end
    end
  end
end
