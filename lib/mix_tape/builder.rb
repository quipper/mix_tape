module MixTape
  module Builder
    extend self

    ## Store definitions in array, so we can generate documenation.
    @@mix_tape = []

    def mix_tape
      @@mix_tape
    end

    def definition(&block)
      block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
    end

    def define(name, desc = '', &block)
      @@mix_tape << [name, desc]

      MixTape.define_singleton_method("track_#{name}") do |*args|
        MixTape.client.track name.to_s, yield(*args)
      end

      MixTape.define_singleton_method("set_#{name}") do |id, *args|
        MixTape.client.set id, yield(*args)
      end
    end

    def method_missing(key, *arguments, &block)
      define(key, arguments.first, &block)
    end
  end
end
