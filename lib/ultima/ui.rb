%w(
  fading
  container
).each { |filename| require "ultima/ui/mixins/#{filename}" }

%w(
  base
  label
  button
  scene
  control_pad
  view
).each { |filename| require "ultima/ui/#{filename}" }

module Ultima
  module UI
  end
end
