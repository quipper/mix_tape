module MixTape

  class FakeTracker
    attr_reader :console_logging

    def initialize(console_logging)
      @console_logging = console_logging
    end

    def track(name, args={})
      puts "FakeTracker.track #{name}, #{args}" if console_logging
    end

    def set(name, args={})
      puts "FakeTracker.set #{name}, #{args}" if console_logging
    end
  end

end
