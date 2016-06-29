module Ultima
  module UI
    module Container
      extend Util::Abstract

      abstract_methods(:content, :window)

      def draw
        content.each(&:draw)
      end

      def update
        content.each(&:update)

        if Gosu.button_down?(Gosu::MsLeft)
          pointer_pos = [window.mouse_x.to_i, window.mouse_y.to_i]

          content.each do |w|
            w.click!(pointer_pos) if w.respond_to?(:click!) &&
                                     w.in?(*pointer_pos, current_zindex)
          end
        end
      end

      protected

      def add_widget(widget)
        content << widget
      end
    end
  end
end
