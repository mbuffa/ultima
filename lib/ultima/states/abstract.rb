module Ultima
  module States
    class Abstract
      def draw
        not_implemented
      end

      def update
        not_implemented
      end

      def enter
        not_implemented
      end

      def leave
        not_implemented
      end

      private

      def not_implemented
        message = "You need to implement ##{caller_locations(1, 1)[0].label}."
        raise NoMethodError.new, message
      end
    end
  end
end
