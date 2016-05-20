require 'gosu'

%w(
  version
  colors
  singer
  world
  widgets
  states
  window
  game
).each { |filename| require "ultima/#{filename}" }

module Ultima
end
