module Ultima
  module UI
    class Scene < Base
      include Util::Hooks
      include Container

      ASSET_WIDTH = 800
      ASSET_HEIGHT = 600

      after :fetch_partial do
        puts "Fetching partial view"
      end

      def initialize(position, grid, camera, size, window)
        @x, @y = position
        @grid = grid
        @camera = camera
        @painter = Core::Painter.new
        @width, @height = size
        @partial = {}
        @content = []
        @window = window
      end

      def draw
        # FIXME: Split this (or use z-index to simplify conditions).
        draw_sprite(:current_ground)
        draw_sprite(:ceiling)

        if !@partial[:front] || @partial[:current].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_front_wall)
        else
          draw_sprite(:front_ground)

          if @partial[:front] && @partial[:front].edges[World::Directions::left_of(@camera.direction)] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_left_wall)
          end

          if @partial[:front] && @partial[:front].edges[World::Directions::right_of(@camera.direction)] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_right_wall)
          end

          if @partial[:front] && @partial[:front].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:front_front_wall)
          end
        end

        if !@partial[:left] || @partial[:left].edges[World::Directions::right_of(@camera.direction)] == World::Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_left_wall)
        else
          draw_sprite(:left_ground)

          if @partial[:left] && @partial[:left].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:left_front_wall)
          end
        end

        if @partial[:lcorner] && @partial[:current].edges[@camera.direction] != World::Tile::EDGE_TYPES[:wall]
          draw_sprite(:front_left_ground)

          if @partial[:lcorner].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:lcorner_front_wall)
          end
        end

        if !@partial[:right] || @partial[:right].edges[World::Directions::left_of(@camera.direction)] == World::Tile::EDGE_TYPES[:wall]
          draw_sprite(:current_right_wall)
        else
          draw_sprite(:right_ground)

          if @partial[:right] && @partial[:right].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:right_front_wall)
          end
        end

        if @partial[:rcorner] && @partial[:current].edges[@camera.direction] != World::Tile::EDGE_TYPES[:wall]
          draw_sprite(:front_right_ground)

          if @partial[:rcorner].edges[@camera.direction] == World::Tile::EDGE_TYPES[:wall]
            draw_sprite(:rcorner_front_wall)
          end
        end

        super
      end

      def update
        # Handle scene interactions here.
        super
      end

      def fetch_partial
        @partial = @grid.first_person(@camera.location, @camera.direction)
      end

      protected

      def content
        @content
      end

      def window
        @window
      end

      def draw_sprite(symbol)
        scale_x = (@width.to_f / ASSET_WIDTH.to_f)
        scale_y = (@height.to_f / ASSET_HEIGHT.to_f)
        @painter.sprite(symbol).draw(@x, @y, 0, scale_x, scale_y)
      end
    end
  end
end
