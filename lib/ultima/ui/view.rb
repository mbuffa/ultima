module Ultima
  module UI
    class View
      include Container

      def initialize(window)
        @window = window
        @content = []
      end

      protected

      def content
        @content
      end

      def window
        @window
      end

      def current_zindex
        0
      end
    end
  end
end
