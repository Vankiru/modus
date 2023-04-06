module Modus
  class Context
    extend Dry::Initializer

    param :values

    def exec(block)
      instance_eval(&block)
    end

    def method_missing(key, *args)
      if values.has_key?(key)
        values[key] 
      else
        raise Modus::ContextNotFoundError, key
      end
    end
  end
end
