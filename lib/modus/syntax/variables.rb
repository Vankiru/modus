module Modus
  module Syntax
    module Variables
      include Structure

      def variable(name, &block)
        structure.variables << Modus::Variable.new(name, block)
      end

      def variables(*names_or_syntax)
        syntax = names_or_syntax.first

        if syntax.is_a?(Modus::Syntax::Variables)
          structure.variables.push(*syntax.structure.variables)
        else
          names.each { |name| variable(name) }
        end
      end
    end
  end
end

#class Variables
  #include Modus::Syntax::Variables

  #variable :a do
  #end

  #variables :a, :b, :c

  #variables Modus::Example::Variables
#end
