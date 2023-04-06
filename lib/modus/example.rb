class Modus::Example < Inference::Engine
  # Variables

  variable :a

  variable :b do |args|
  end

  variables :a, :b, :c

  variables Modus::Example::Variables

  # Rules

  rule :one do
    premise {}
    outputs {}
  end

  rule :two do
    premise {}
    outputs {}
  end

  premise :one do
  end

  premise :two do
  end

  paramateres do
  end

  rules Modus::Example::Rules

  # Outputs

  output :a, :max

  output :a do
  end

  outputs a: :max, b: :min
end

module Modus::Example::Variables
  include Modus::Syntax::Variables

  variable :a

  variable :b do
  end

  variables :a, :b, :c
end

module Modus::Example::Rules
  include Modus::Syntax::Rules

  rule :one do
    premise {}
    outputs {}
  end

  premise :one do
  end

  premise :two do
  end

  paramateres do
  end
end

module Modus::Example::Rules
  include Modus::Syntax::Rules

  rule :one do
    premise {}
    outputs {}
  end

  premise :one do
  end

  premise :two do
  end

  paramateres do
  end

  rule { eq: [:a, 1] } => { output: 2 }
end
