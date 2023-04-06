module Modus
  class Error < StandardError
    extend Dry::Initializer
  end

  class ConstantNotFoundError < Error
    param :constant

    def message
      "Constant #{constant} is not defined in the rule"
    end
  end

  class VariableNotFoundError < Error
    param :variable

    def message
      "Variable #{variable} is not defined in the engine"
    end
  end

  class ContextNotFoundError < Error
    param :name

    def message
      "There is no a constant or a variable with name = #{name} in the engine"
    end
  end
end
