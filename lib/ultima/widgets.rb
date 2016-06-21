%w(
  fading
).each { |filename| require "ultima/widgets/mixins/#{filename}" }

%w(
  base
  label
  button
  scene
  control_pad
  view
).each { |filename| require "ultima/widgets/#{filename}" }

module Ultima
  module Widgets
  end
end
