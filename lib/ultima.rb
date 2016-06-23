require 'gosu'

%w(
  version
  util
  world
  ui
  states
  views
  core
).each { |filename| require "ultima/#{filename}" }

module Ultima
end
