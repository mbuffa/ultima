module Ultima
  module States
    class Abstract
      extend Util::Abstract

      abstract_methods(:draw, :update, :enter, :leave)
    end
  end
end
