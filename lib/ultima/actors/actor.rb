module Ultima
  module Actors
    class Actor < UI::Base
      extend Util::Hinting

      attr_reader :width, :height

      def initialize(position, size, entity)
        @x, @y = position
        @width, @height = size
        @entity = entity
        @limiter = Core::Limiter.new(Core::Rules::ACTIONS_LIMIT)
        @limiter.reset!
      end
      hint_method(:initialize, [Array, Array])

      def draw
      end

      def update
      end

      def on_click(&block)
        @on_click = block
      end

      def click!(*args)
        return if !@limiter.may_act?
        instance_eval(&@on_click)
        @limiter.act!
      end
    end
  end
end
