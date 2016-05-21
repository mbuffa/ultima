module Ultima
  module Util
    module Abstract
      def abstract_methods(*symbols)
        symbols.each do |symbol|
          define_method(symbol) do |*_args, &_block|
            reason = "##{symbol} is not implemented in #{self.class.name}"
            raise NotImplementedError, reason
          end
        end
      end
      alias abstract_method abstract_methods
    end
  end
end
