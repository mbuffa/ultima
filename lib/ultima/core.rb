%w(
  colors
  singer
  window
  game
).each { |filename| require "ultima/core/#{filename}" }

module Ultima
  module Core
  end
end
