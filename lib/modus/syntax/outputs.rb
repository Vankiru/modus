module Modus
  module Syntax
    module Outputs
      include Structure

      def output(name, aggregate = nil, options = {}, &block)
        structure.outputs << Modus::Output.new(name, aggregate, options, block)
      end

      def outputs(*outputs_or_syntax)
        syntax = outputs_or_syntax.first

        if syntax.is_a?(Modus::Syntax::Outputs)
          structure.outputs.push(*syntax.structure.outputs)
        else
          outputs_or_syntax.each { |*args| output(args) }
        end
      end
    end
  end
end

#class Outputs
  #include Modus::Syntax::Outputs

  #output :a, :max

  #output :a do
  #end

  #outputs a: :max, b: :min

  #outputs Modus::Example::Outputs
#end
