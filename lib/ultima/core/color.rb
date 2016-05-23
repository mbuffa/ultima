module Gosu
  class Color
    def transparent
      copy = self.dup
      copy.alpha = 0
      copy
    end

    def new_with_alpha(alpha)
      copy = self.dup
      copy.alpha = alpha
      copy
    end
  end
end
