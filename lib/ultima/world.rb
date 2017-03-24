%w(
  location
  directions
  tile
  grid
  camera
).each { |filename| require "ultima/world/#{filename}" }

module Ultima
  module World
  end
end
