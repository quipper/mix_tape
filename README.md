# MixTape

## The Problem

Littering controllers with MixPanel events passing large payloads adds to the wait and concern of controllers. It also makes it difficult to keep on top of what triggers already exist.

This gem proposes a DSL for specifying your events in advance, and keeping them in a single file.

### Defining your Events


    MixTape::Builder.definition do

      button_click "Log number of times user clicks button" do |user, button|
        {
          user_name:   user.username,
          user_id:     user.id,
          button_id:   button.id,
          button_page: button.page
        }
      end

      checks_mail "User just checked their mail" do |user, inbox|
        {
          user_name:    user.username,
          user_id:      user.id,
          unread_count: inbox.count
        }
      end

      user_invites_friend "User has invited a friend" do |user, friend|
        {
          user_name:    user.username,
          user_id:      user.id,
          friend_name:  friend.name
        }
      end
    end


To trigger a defined event call:


    MixTape.trigger_user_invites_friend(user, friend)


### TODO

A rake task for presenting all available events with descriptions.

    rake tape_mix:events

    trigger_button_click
        Log number of times user clicks button

    ...

## Installation

Add this line to your application's Gemfile:

    gem 'mix_tape'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mix_tape

## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
