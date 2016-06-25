require 'gosu'

%w(
  version
  util
  core
  world
  entities
  ui
  actors
  states
  views
).each { |filename| require "ultima/#{filename}" }

module Ultima
end
