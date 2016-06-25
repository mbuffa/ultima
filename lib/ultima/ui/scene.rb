module Ultima
  module UI
    class Scene < Base
      include Util::Hooks
      include Container

      ASSET_WIDTH = 800
      ASSET_HEIGHT = 600

      ZINDEX = {
        immediate: 1,
        side: -1,
        distant: -5,
        far: -10
      }

      after :fetch_partial do
        Core::Logger.log("Fetching partial view", :info)
      end

      def initialize(position, grid, camera, size, window)
        @x, @y = position
        @grid = grid
        @camera = camera
        @width, @height = size
        @window = window
        @painter = Core::Painter.new
        @partial = {}
        @content = []
      end

      def side_to_edge
        {
          left: World::Directions.left_of(@camera.direction),
          front: @camera.direction,
          right: World::Directions.right_of(@camera.direction)
        }
      end

      def draw
        draw_sprite(:ceiling, ZINDEX[:immediate])
        draw_partial(:current, ZINDEX[:immediate])
        draw_partial(:left, ZINDEX[:side]) if @partial[:left]
        draw_partial(:front, ZINDEX[:distant]) if @partial[:front]
        draw_partial(:right, ZINDEX[:side]) if @partial[:right]
        draw_partial(:lcorner, ZINDEX[:far]) if @partial[:lcorner]
        draw_partial(:rcorner, ZINDEX[:far]) if @partial[:rcorner]

        super
      end

      def update
        # Handle scene interactions here.
        super
      end

      def fetch_partial
        @partial = @grid.first_person(@camera.location, @camera.direction)

        @content = @grid.entities_in(@camera.location).select do |obj|
          obj.type == Entities::TYPES[:item] || obj.direction == @camera.direction
        end.map do |obj|
          # TODO: Better handle actors width and height.
          Actors::Factory.create([@x, @y], [@width, @height], obj)
        end
      end

      protected

      def content
        @content
      end

      def window
        @window
      end

      def draw_partial(partial_type, zindex)
        if @partial[partial_type].free?
          draw_sprite("#{partial_type}_ground".to_sym, zindex + 1)
        end

        [:left, :front, :right].each do |side|
          edge_type = @partial[partial_type].edges[side_to_edge[side]]
          if [:door, :wall].include?(edge_type)
            # Special case for doors: draw the underlying wall.
            draw_sprite("#{partial_type}_#{side}_wall".to_sym, zindex) if edge_type == :door

            draw_sprite("#{partial_type}_#{side}_#{edge_type}".to_sym, zindex)
          end
        end
      end

      def draw_sprite(symbol, zindex = 0)
        scale_x = (@width.to_f / ASSET_WIDTH.to_f)
        scale_y = (@height.to_f / ASSET_HEIGHT.to_f)
        begin
          @painter.sprite(symbol).draw(@x, @y, zindex, scale_x, scale_y)
        rescue => e
          Core::Logger.log("Missing Sprite: #{symbol}", :fatal)
        end
      end
    end
  end
end
