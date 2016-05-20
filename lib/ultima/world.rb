%w(
  grid
  critter
).each { |filename| require "ultima/world/#{filename}" }

module Ultima
  module World
  end
end
