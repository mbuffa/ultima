module Ultima
  module Views
    class Play < UI::View
      attr_reader :scene

      def initialize(window, grid, camera)
        super(window)
        @scene = UI::Scene.new([window.width / 4, window.height / 24],
                               grid,
                               camera,
                               [window.width / 2, window.height / 2],
                               window)

        control_pad = UI::ControlPad.new([window.width / 2, (window.height - window.height / 3), 0], camera)
        control_pad.scene = @scene

        add_widget(@scene)
        add_widget(control_pad)
      end
    end
  end
end
