module Ultima
  module World
    class Scene
      def initialize(x, z, width, height)
        @painter = Core::Painter.new
        @x = x
        @z = z
        @width = width
        @height = height
      end

      def draw(camera)
        # FIXME: Split this (or use z-index to simplify conditions).
        draw_sprite(:current_ground)
        draw_sprite(:ceiling)

        if !@partial[:front] || @partial[:current].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_front_wall)
        else
          draw_sprite(:front_ground)

          if @partial[:front] && @partial[:front].edges[Directions::left_of(camera.direction)] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_left_wall)
          end

          if @partial[:front] && @partial[:front].edges[Directions::right_of(camera.direction)] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_right_wall)
          end

          if @partial[:front] && @partial[:front].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_front_wall)
          end
        end

        if !@partial[:left] || @partial[:left].edges[Directions::right_of(camera.direction)] == Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_left_wall)
        else
          draw_sprite(:left_ground)

          if @partial[:left] && @partial[:left].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:left_front_wall)
          end
        end

        if @partial[:lcorner] && @partial[:current].edges[camera.direction] != Tile::EDGE_TYPES[:wall]
          draw_sprite(:front_left_ground)

          if @partial[:lcorner].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:lcorner_front_wall)
          end
        end

        if !@partial[:right] || @partial[:right].edges[Directions::left_of(camera.direction)] == Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_right_wall)
        else
          draw_sprite(:right_ground)

          if @partial[:right] && @partial[:right].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:right_front_wall)
          end
        end

        if @partial[:rcorner] && @partial[:current].edges[camera.direction] != Tile::EDGE_TYPES[:wall]
          draw_sprite(:front_right_ground)

          if @partial[:rcorner].edges[camera.direction] == Tile::EDGE_TYPES[:wall]
            draw_sprite(:rcorner_front_wall)
          end
        end
      end

      def update(grid, camera)
        @partial = grid.first_person(camera.location, camera.direction)

        p @partial.keys
      end

      protected

      def draw_sprite(symbol)
        @painter.sprite(symbol).draw(@x, @z, 0, 1, 1)
      end
    end
  end
end
