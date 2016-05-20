%w(
  abstract
  intro
  menu
  play
).each { |filename| require "ultima/states/#{filename}" }

module Ultima
  module States
  end
end
