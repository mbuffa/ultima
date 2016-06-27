module Ultima
  module Entities
    class Door < Entity
      STATES = {
        open: true,
        closed: false
      }

      def initialize(location, direction, twin = nil)
        super(location, direction, Entities::TYPES[:door], twin)
      end

      def open?
        @state == STATES[:open]
      end

      def closed?
        @state == STATES[:closed]
      end

      def toggle!(cascade: false)
        Core::Logger.log('Toggling the door.', :info)
        @state = !@state
        @twin.toggle! if @twin && cascade
        true
      end
    end
  end
end
