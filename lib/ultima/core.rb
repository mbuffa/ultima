%w(
  logger
  rules
  color
  painter
  singer
  limiter
  window
  game
).each { |filename| require "ultima/core/#{filename}" }

module Ultima
  module Core
  end
end
