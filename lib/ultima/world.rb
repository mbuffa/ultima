%w(
  location
  directions
  tile
  grid
  camera
  scene
  critter
).each { |filename| require "ultima/world/#{filename}" }

module Ultima
  module World
  end
end
