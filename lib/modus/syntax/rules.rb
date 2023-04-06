module Modus
  module Syntax
    module Rules
      include Structure

      def rule(name = nil, &block)
        structure.rules << Modus::Rule.new(premise, outputs)
      end

      def premise(name = nil, &block)
        structure.premises << Modus::Premise.new(name, block)
      end
      
      def parameters(&block)
        structure.parameters = Modus::Parameters.new(block)
      end

      def rules(syntax)
        if syntax.is_a?(Modus::Syntax::Rules)
          structure.rules.push(*syntax.structure.rules)
        end
      end
    end
  end
end

#module Rules
  #include Modus::Syntax::Rules

  #rule :a do
    #premise {}
    #outputs {}
  #end

  #premise :b do
  #end

  #parameters do
  #end
#end
