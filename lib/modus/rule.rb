module Modus
  class Rule
    extend Dry::Initializer

    option :premise
    option :outputs

    option :name, optional: true
    option :constants, optinal: true

    def infer(variables)
      outputs if success?(variables)
    end

    def success?(variables)
      context(variables).exec(premise)
    end

    def context(variables)
      values = 
        if constants && constants.any?
          constants.merge(variables)
        else
          variables
        end

      Modus::Context.new(values)
    end
  end
end
