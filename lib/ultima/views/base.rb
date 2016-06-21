module Ultima
  module Views
    class Base
      def initialize(window)
        @widgets = []
        @window = window
      end

      def draw
        @widgets.each(&:draw)
      end

      def update
        @widgets.each(&:update)

        if Gosu.button_down?(Gosu::MsLeft)
          pointer_pos = [@window.mouse_x.to_i, @window.mouse_y.to_i]

          @widgets.each do |w|
            w.click!(pointer_pos) if w.respond_to?(:click!) &&
                                     w.in?(*pointer_pos, current_zindex)
          end
        end
      end

      protected

      def add_widget(widget)
        @widgets << widget
      end

      def current_zindex
        # STUB
        0
      end
    end
  end
end
