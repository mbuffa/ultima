require 'gosu'

%w(
  version
  util
  world
  widgets
  states
  views
  core
).each { |filename| require "ultima/#{filename}" }

module Ultima
end
