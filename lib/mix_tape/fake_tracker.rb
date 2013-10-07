module MixTape

  class FakeTracker
    attr_reader :console_logging

    def initialize(console_logging)
      @console_logging = console_logging
    end

    def track(distinct_id, name, args={})
      puts "FakeTracker.track #{distinct_id}, #{name}, #{args}" if console_logging
    end

    def people
      @people ||= People.new(console_logging)
    end

    class People
      attr_reader :console_logging

      def initialize(console_logging)
        @console_logging = console_logging
      end

      def set(name, args={})
        puts "FakeTracker.set #{name}, #{args}" if console_logging
      end
    end
  end

end
