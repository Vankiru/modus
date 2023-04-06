module Modus
  class Engine
    extend Modus::Syntax
    extend Dry::Initializer

    param :options, default: ->{ {} }

    def infer(inputs)
      variables = variables(inputs)

      outputs = rules.map do |rule|
        rule.infer(variables)
      end

      aggregate(outputs)
    end

    def structure
      self.class.structure
    end

    private

    def variables(inputs)
      structure.variables.reduce({}) do |hash, variable|
        hash[variable.name] = variable.value(inputs); hash
      end
    end

    def rules
      parameters.map do |parameter|
        structure.premises.map do |premise|
          premise.to_rule(parameter)
        end
      end.flatten
    end

    def parameters
      structure.parameters.exec(options)
    end

    def aggregate(outputs)
      structure.outputs.reduce({}) do |hash, output|
        values = outputs.compact.map { |o| o[output.name] }

        result = output.aggregate(values)
        hash[output.name] = result if result

        hash
      end
    end
  end
end
