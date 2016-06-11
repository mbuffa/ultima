module Ultima
  module Util
    module Hooks
      def self.included(base)
        base.send(:extend, ClassMethods)
      end

      module ClassMethods
        [:before, :after].each do |type|
          define_method(type) do |hooks_on, options = {}, &block|
            Array(hooks_on).map do |hook_on|
              _hook(type, hook_on, options[:do], &block)
            end
          end
        end

        private

        def _hook(hook_type, hook_on, method_sym = nil, &block)
          prependable = Module.new do
            define_method(hook_on) do |*args|
              super(*args) if hook_type == :after
              method_sym ? send(method_sym) : instance_eval(&block)
              super(*args) if hook_type == :before
            end
          end
          prepend prependable
        end
      end
    end
  end
end
