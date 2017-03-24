module Ultima
  module Actors
    class Factory
      def self.create(position, size, entity)
        if entity.type == Entities::TYPES[:door]
          # FIXME: Replace this properly.
          image = Gosu::Image.new('data/sprites/current_front_door.png')
          obj = Actor.new(position, size, entity, image) do
            @entity.toggle!(cascade: true)
          end
        end
        obj
      end
    end
  end
end
