module Ultima
  module Util
    # This module allow some sort of type hinting for instance methods.
    # Set required variable types with #hint, and don't forget to call
    # #hint_method(your_method_symbol) after its definition.
    # It'll raise an ArgumentError if types mismatch.
    module Hinting
      @@hinting = Hash.new

      def self.extended(base)
        base.class_eval do
          define_singleton_method(:hint_method) do |method_symbol|
            meth = instance_method(method_symbol)

            define_method(method_symbol) do |*args, &block|
              meth.parameters.map(&:last)
                             .each.with_index do |param_sym, i|
                args.each.with_index do |arg, j|
                  # TODO: Find a better way than this...
                  next if i != j

                  type_hint = @@hinting[param_sym]

                  if !type_hint.nil? && type_hint != arg.class
                    raise ArgumentError, "#{param_sym} must be #{type_hint}"
                  end
                end
              end
              meth.bind(self).call(*args, &block)
            end
          end
        end
      end

      def hint(symbols, type)
        Array(symbols).each do |param_sym|
          @@hinting[param_sym] = type
        end
      end

      def hinting
        @@hinting
      end
    end
  end
end
