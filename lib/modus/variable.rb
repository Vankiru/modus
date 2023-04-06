module Modus
  class Variable
    extend Dry::Initializer

    param :name
    param :block

    def value(inputs)
      if block
        Context.new(inputs).exec(&block)
      else
        inputs[name]
      end
    end
  end
end
