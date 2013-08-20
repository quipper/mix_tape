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
    MixTape.config{ |config| config.fake = true }

    expect(MixTape.client).to be_a MixTape::FakeTracker
  end
end
