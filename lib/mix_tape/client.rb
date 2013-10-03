module MixTape

  class << self
    attr_accessor :token, :fake, :console_logging, :request

    def client
      raise(ArgumentError, %{MixPanel token is undefined.}) if (token.nil? || token.empty?) && !fake
      @client = mix_client
    end

    def config(&block)
      instance_eval(&block)
    end

    private

    def mix_client
      if !!fake
        FakeTracker.new(console_logging)
      else
        Mixpanel::Tracker.new(token)
      end
    end
  end
end
