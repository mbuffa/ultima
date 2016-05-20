require 'gosu'

%w(
  version
  util
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
