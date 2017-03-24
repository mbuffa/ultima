module Ultima
  module Actors
    class Actor < UI::Base
      extend Util::Hinting

      ZINDEX = 100

      attr_reader :width, :height

      def initialize(position, size, entity, image, &block)
        @x, @y = position
        @width, @height = size
        @entity = entity
        @on_click = block
        super(position, image)
        @limiter = Core::Limiter.new(Core::Rules::ACTIONS_LIMIT)
        @limiter.reset!
      end
      hint_method(:initialize, [Array, Array])

      def draw
        @image.draw(@x, @y, ZINDEX)
      end

      def update
      end

      def click!(*args)
        return if !@limiter.may_act?
        position = args.first if args.is_a?(Array)
        alpha = @image.get_pixel(position.first - @x, position.last - @y).last
        return if alpha.zero?
        instance_eval(&@on_click)
        @limiter.act!
      end
    end
  end
end
