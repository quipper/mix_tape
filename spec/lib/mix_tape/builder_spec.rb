require 'spec_helper'

MixTape::Builder.definition do

  button_click "Log number of times user clicks button" do |user, button|
    {
      user_name:   user.username,
      user_id:     user.id,
      button_id:   button.id,
      button_page: button.page
    }
  end

  checks_mail "User just checked mail" do |user, inbox|
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

  it "creates payload for posting" do
    expected =  { user_name: "Zeus", user_id: "1", button_id: "2", button_page: "homepage" }

    expect(
      MixTape.track_button_click(user, button)
    ).to eq(expected)
  end
end