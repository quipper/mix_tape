module MixTape
  module Builder
    extend self

    ## Store definitions in array, so we can generate documenation.
    @@mix_tape = []

    def definition(&block)
      block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
    end

    def define(name, desc = '', &block)
      method_name = "track_#{name}"
      @@mix_tape << [method_name, desc]

      MixTape.define_singleton_method(method_name) do |*args|
        yield(*args)
      end
    end

    def method_missing(key, *arguments, &block)
      define(key, arguments.first, &block)
    end
  end
end