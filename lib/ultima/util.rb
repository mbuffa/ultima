%w(
  exceptions
  abstract
  hinting
  hooks
).each { |filename| require "ultima/util/#{filename}" }

module Ultima
  module Util
  end
end
