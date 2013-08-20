module MixTape

  class << self
    attr_accessor :token

    def client
      raise(ArgumentError, %{MixPanel token is undefined.}) if token.empty?
      @client ||= Mixpanel::Tracker.new(token, async: true)
    end

    def config(&block)
      instance_eval &block
    end
  end
end