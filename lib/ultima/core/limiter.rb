module Ultima
  module Core
    class Limiter
      def initialize(limit_rate)
        @limit_rate = limit_rate
        reset!
      end

      def reset!
        @action_taken_at = nil
      end

      def act!
        @action_taken_at = Gosu::milliseconds
      end

      def may_act?
        @action_taken_at.nil? || !(Gosu::milliseconds - @action_taken_at < @limit_rate)
      end
    end
  end
end
