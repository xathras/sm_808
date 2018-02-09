require 'instrument'
require 'song'

Signal.trap('INT') {
  puts 'Interrupted...'
  exit
}

song = Song.new(bpm: 128, title: 'Animal Rights')
        .with_instrument(Instrument.new('Kick', '|X|_|_|_|X|_|_|_|'))
        .with_instrument(Instrument.new('Snare', '|_|_|_|_|X|_|_|_|'))
        .with_instrument(Instrument.new('HiHat', '|_|_|X|_|_|_|X|_|'))

song.play
