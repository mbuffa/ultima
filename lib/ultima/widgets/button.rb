module Ultima
  module Widgets
    class Button < Label
      prepend Fading

      def initialize(position, text, options = {}, &block)
        super(position, text, options)
        @block = block
      end

      def draw(*args)
        super(*args)
      end

      def update
      end

      def click!
        @block.call
      end
    end
  end
end
