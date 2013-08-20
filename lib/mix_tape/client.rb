module MixTape

  class << self
    attr_accessor :token

    def client
      @client ||= Mixpanel::Tracker.new(token, async: true)
    end

    def config(&block)
      instance_eval &block
    end
  end
end