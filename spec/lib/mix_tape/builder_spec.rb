require 'spec_helper'

MixTape::Builder.definition do

  button_click "Log number of times user clicks button" do |user, button|
    {
      user_name:    user.username,
      distinct_id:  user.id,
      button_id:    button.id,
      button_page:  button.page
    }
  end

  checks_mail "When user checks mail" do |user, inbox|
    {
      user_name:    user.username,
      user_id:      user.id,
      unread_count: inbox.count
    }
  end
end

describe "Triggering Events" do
  let(:user)   { double(username: 'Zeus', id: '1') }
  let(:button) { double(id: '2', page: 'homepage') }
  let(:client) { double('client') }

  before do
    MixTape.stub(:client){ client }
  end

  it "tracks" do
    expected_properties =  { user_name: "Zeus", button_id: "2", button_page: "homepage" }

    client.should_receive(:track).with("1", "button_click", expected_properties)
    MixTape.track_button_click(user, button)
  end

  it "sets" do
    expected_properties =  { user_name: "Zeus", distinct_id: "1", button_id: "2", button_page: "homepage" }

    client.should_receive(:set).with("1", expected_properties)
    MixTape.set_button_click(user.id, user, button)
  end
end
