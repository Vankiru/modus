module Modus
  class Premise
    extend Dry::Initializer

    param :name
    param :block

    def to_rule(parameter)
      Rule.new(
        name: name,
        premise: block,
        outputs: parameter.outputs.symbolize_keys!,
        constants: parameter.constants.symbolize_keys!
      )
    end
  end
end
