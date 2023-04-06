module Modus
  class Structure
    attr_accessor :parameters

    def variables
      @variables ||= Array.new
    end

    def rules
      @rules ||= Array.new
    end

    def premises
      @premises ||= Array.new
    end

    def outputs
      @outputs ||= Array.new
    end
  end
end
