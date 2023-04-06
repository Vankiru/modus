module Modus
  class Aggregation
    class Last < Modus::Aggregation
      # TODO: priority
      def aggregate(values)
        values.last
      end
    end
  end
end
