module Ultima
  module Widgets
    class ControlPad < Base
      ACTIONS_TO_ZONES = {
        turn_left!: [ [1, 1], [49, 49] ],
        forward!: [ [51, 1], [99, 49] ],
        turn_right!: [ [100, 1], [148, 49] ],
        strafe_left!: [ [1, 51], [49, 99] ],
        backward!: [ [51, 51], [99, 99] ],
        strafe_right!: [ [100, 51], [148, 99] ]
      }

      def initialize(position, camera)
        image = Gosu::Image.new('data/sprites/control_pad.png')
        # TODO: Move this to Base.
        position[0] -= image.width / 2
        position[1] -= image.height / 2
        super(position, image)
        @x, @y, @z = position
        @camera = camera
        @limiter = Core::Limiter.new(Core::Rules::ACTIONS_LIMIT)
      end

      def draw
        scale_x, scale_y = [1, 1]
        @image.draw(@x, @y, @z, scale_x, scale_y)
      end

      def update
        return if !@limiter.may_act?
      end

      def scene=(scene)
        @scene = scene
      end

      def click!(*args)
        return if !@limiter.may_act?

        mouse_x, mouse_y = args.first
        ACTIONS_TO_ZONES.each do |action, ranges|
          xrange = Range.new((@x + ranges[0][0]), (@x + ranges[1][0]))
          yrange = Range.new((@y + ranges[0][1]), (@y + ranges[1][1]))

          if xrange.cover?(mouse_x.to_i) && yrange.cover?(mouse_y.to_i)
            @limiter.act!
            @camera.send(action)
            @scene.fetch_partial
          end
        end
      end
    end

  end
end
