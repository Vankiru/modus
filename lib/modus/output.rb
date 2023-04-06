module Modus
  class Output
    extend Dry::Initializer

    param :name
    param :aggregation
    param :options
    param :block

    def aggregate(values)
      Modus::Aggregation.find(aggregation, options, block).aggregate(values)
    end
  end
end
