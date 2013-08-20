require 'mix_tape'

namespace :mix_tape do
  desc "Generates list of defined events"
  task :events do
    MixTape::Builder.mix_tape.each do |event, desc|
      puts "++ #{event} ++"
      puts desc
      puts
    end
  end
end