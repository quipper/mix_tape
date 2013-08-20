require 'spec_helper'

describe 'Configuraton' do
  it "sets token" do
    MixTape.config do |config|
      config.token =  '1234'
    end

    expect(MixTape.token).to eq('1234')
  end
end

