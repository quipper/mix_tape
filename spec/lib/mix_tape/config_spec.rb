require 'spec_helper'

describe 'Configuraton' do
  it "sets token" do
    MixTape.config do |config|
      config.token =  '1234'
    end

    expect(MixTape.token).to eq('1234')
  end

  it "raises when token not defined" do
    MixTape.config{ |config|config.token = '' }

    expect{
      MixTape.client
    }.to raise_error("MixPanel token is undefined.")
  end
end

