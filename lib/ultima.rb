require 'gosu'

%w(
  version
  util
  world
  widgets
  states
  core
).each { |filename| require "ultima/#{filename}" }

module Ultima
end
