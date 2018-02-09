# frozen_string_literal: true

require 'instrument'
require 'song'

Signal.trap('INT') do
  puts 'Interrupted...'
  exit
end

STDOUT.sync = true
song = Song.new('Animal Rights', 128)
           .with_instrument(Instrument.new('Kick', '|X|_|_|_|X|_|_|_|'))
           .with_instrument(Instrument.new('Snare', '|_|_|_|_|X|_|_|_|'))
           .with_instrument(Instrument.new('HiHat', '|_|_|X|_|_|_|X|_|'))

song.play(STDOUT)
