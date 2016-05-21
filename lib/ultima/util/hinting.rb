module Ultima
  module Util
    # This module allow some sort of type hinting for instance methods.
    # It'll raise an ArgumentError if types mismatch.
    module Hinting
      def self.extended(base)
        base.class_eval do
          define_singleton_method(:hint_method) do |method_symbol, hinting|
            meth = instance_method(method_symbol)
            hinting = Array(hinting) # Handle one or many hintings.

            define_method(method_symbol) do |*args, &block|
              meth.parameters
                  .map(&:last)
                  .each.with_index do |param_sym, index|
                type_hint = hinting[index]
                # Skip if no hinting defined.
                # TODO: Change this using Array#size to allow one to
                #       skip some parameters hinting.
                next if type_hint.nil?

                if !type_hint.nil? && type_hint != args[index].class
                  raise ArgumentError, "#{param_sym} must be #{type_hint}"
                end
              end
              meth.bind(self).call(*args, &block)
            end
          end
        end
      end
    end
  end
end
