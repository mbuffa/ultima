module Ultima
  module Entities
    class Door < Entity
      STATES = {
        open: true,
        closed: false
      }

      def initialize(location, direction)
        super(location, direction, Entities::TYPES[:door])
      end

      def open?
        @state == STATES[:open]
      end

      def closed?
        @state == STATES[:closed]
      end

      def toggle!
        p 'toggling'
        @state = !@state
        true
      end
    end
  end
end
