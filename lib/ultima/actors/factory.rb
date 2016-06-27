module Ultima
  module Actors
    class Factory
      def self.create(position, size, entity)
        if entity.type == Entities::TYPES[:door]
          obj = Actor.new(position, size, entity)
          obj.on_click do
            @entity.toggle!(cascade: true)
          end
        end
        obj
      end
    end
  end
end
