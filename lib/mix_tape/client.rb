module MixTape

  class << self
    attr_accessor :token, :fake, :console_logging, :request

    def client
      raise(ArgumentError, %{MixPanel token is undefined.}) if (token.nil? || token.empty?) && !fake
      @client = mix_client
    end

    def config(&block)
      instance_eval &block
    end

    private

    def mix_client
      if !!fake
        FakeTracker.new(console_logging)
      else
        Mixpanel::Tracker.new(token, :async => true, :env => @request ? env : {})
      end
    end

    def env
      e = @request.is_a?(Hash) ? @request : @request.env
      {
        'REMOTE_ADDR' => e['REMOTE_ADDR'],
        'HTTP_X_FORWARDED_FOR' => e['HTTP_X_FORWARDED_FOR'],
        'rack.session' => e['rack.session'],
        'mixpanel_events' => e['mixpanel_events']
      }
    end
  end
end
