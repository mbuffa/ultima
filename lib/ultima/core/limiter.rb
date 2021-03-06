module Ultima
  module Core
    class Limiter
      def initialize(limit_rate)
        @limit_rate = limit_rate
        reset!
      end

      def reset!
        @acted_at = nil
        true
      end

      def act!
        @acted_at = Gosu::milliseconds
        true
      end

      def may_act?
        @acted_at.nil? || Gosu::milliseconds - @acted_at > @limit_rate
      end
    end
  end
end
