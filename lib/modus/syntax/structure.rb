module Modus
  module Syntax
    module Structure
      def structure
        @structure ||= Modus::Structure.new
      end
    end
  end
end
