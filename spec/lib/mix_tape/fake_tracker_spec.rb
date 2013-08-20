require 'spec_helper'

describe 'FakeTracker' do
  context 'logging' do
    let(:client) { MixTape::FakeTracker.new(true) }

    it "logs track events to the console" do
      Object.any_instance.should_receive(:puts)
      client.track "button_click"
    end

    it "logs set events to the console" do
      Object.any_instance.should_receive(:puts)
      client.set 1
    end
  end

  context 'no logging' do
    let(:client) { MixTape::FakeTracker.new(false) }

    it "does not log anything" do
      Object.any_instance.should_not_receive(:puts)
      client.track "button_click"
      client.set 1
    end
  end
end