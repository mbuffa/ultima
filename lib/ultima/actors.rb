%w(
  factory
  actor
).each { |filename| require "ultima/actors/#{filename}" }

module Ultima
  module Actors
  end
end
