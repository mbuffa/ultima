%w(
  entity
  door
).each { |filename| require "ultima/entities/#{filename}" }

module Ultima
  module Entities
  end
end
