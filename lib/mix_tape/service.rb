module MixTape
  API_TOKEN = ENV[]

  class << self
    def client
      @client ||= Mixpanel::Tracker.new(API_TOKEN, async: true)
    end
  end
end