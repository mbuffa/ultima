module Ultima
  module World
    class Scene
      def initialize
      end

      def draw(x, z, width, height)
      end

      def update(grid, camera)
        @partial = grid.first_person(camera.location, camera.direction)
      end
    end
  end
end
