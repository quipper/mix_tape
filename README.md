# MixTape

## The Problem

Littering controllers with MixPanel events with large param payloads isn't a nice thing to do.

`MixTape` tries to help by creating a DSL for specifying your events in advance, and keeping them in a single file.

## Defining your Events

    MixTape::Builder.definition do

      button_click "Log number of times user clicks button" do |user, button|
        {
          user_name:   user.username,
          distinct_id: user.id,
          button_id:   button.id,
          button_page: button.page
        }
      end

      checks_mail "User just checked their mail" do |user, inbox|
        {
          distinct_id: user.id,
          user_name:    user.username,
          user_id:      user.id,
          unread_count: inbox.count
        }
      end

      user_invites_friend "User has invited a friend" do |user, friend|
        {
          distinct_id: user.id,
          user_name:    user.username,
          user_id:      user.id,
          friend_name:  friend.name
        }
      end
    end


To track a defined event:

    MixTape.track_user_invites_friend(user, friend)

To update an existing event object:

    MixTape.set_user_invites_friend(user, friend)

## Available Events

To view defined events:

    rake mix_tape:events

## Installation

Add this line to your application's Gemfile:

    gem 'mix_tape'

Don't forget to set your MixPanel API token:

    MixTape.config do |config|
      config.token =  '12345'
    end

If you are in a dev or test environment and don't want to send events to MixPanel:

    MixTape.config do |config|
      config.fake = true
      config.console_logging = true
    end

If you want Mixpanel to use your request variables to track user's location etc, then add this to your application controller:

    before_filter :update_mixtape_request

    def update_mixtape_request
      MixTape.request = request
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mix_tape


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
