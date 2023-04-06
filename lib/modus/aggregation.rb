module Modus
  class Aggregation
    extend Dry::Initializer

    param :type
    param :options, default: ->{ {} }
    param :block, default: ->{ nil }

    def self.find(name, options, block)
      klass = 
        "Modus::Aggregation::#{name.to_s.camelcase}"
          .classify
          .constantize

      klass.new(name, options, block)
    end

    def aggregate(values)
    end
  end
end
