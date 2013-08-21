require 'spec_helper'

describe 'Configuraton' do
  it "sets token" do
    MixTape.config do |config|
      config.token =  '1234'
    end

    expect(MixTape.token).to eq('1234')
  end

  it "raises when token not defined" do
    MixTape.config{ |config| config.token = '' }

    expect{
      MixTape.client
    }.to raise_error("MixPanel token is undefined.")
  end

  it "uses MixPanel if all goes well" do
    MixTape.config{ |config| config.token = '1234' }

    expect(MixTape.client).to be_a Mixpanel::Tracker
  end

  it "uses FakeTracker if we set it up" do
    MixTape.config{ |config| config.fake = true; config.token = nil }

    expect(MixTape.client).to be_a MixTape::FakeTracker
  end

  it "can use request.env information" do
    MixTape.config{ |config| config.token = '1234'; config.fake = false }
    MixTape.request = double(:http_request, env: { 'REMOTE_ADDR' => '127.0.0.1' })

    Mixpanel::Tracker.should_receive(:new).with('1234', {
        async: true,
        env: {
            'REMOTE_ADDR' => '127.0.0.1',
            'HTTP_X_FORWARDED_FOR' => nil,
            'rack.session' => nil,
            'mixpanel_events' => nil
        }
    })

    MixTape.client
  end
end
