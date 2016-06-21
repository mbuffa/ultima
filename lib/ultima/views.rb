%w(
  base
  play
).each { |filename| require "ultima/views/#{filename}" }

module Ultima
  module Views
  end
end
