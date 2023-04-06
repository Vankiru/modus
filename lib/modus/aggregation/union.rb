module Modus
  class Aggregation
    class Union < Modus::Aggregation
      def aggregate(values)
        values
      end
    end
  end
end
