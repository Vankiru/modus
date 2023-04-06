module Modus
  class Parameters
    extend Dry::Initializer

    param :block

    def exec(options)
      block.call(options)
    end
  end
end
