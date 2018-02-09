require 'sequence'

class Song
  attr_reader :title, :bpm, :instruments

  def initialize(title:, bpm:, instruments: [])
    @title = title
    @bpm = bpm
    @instruments = instruments.freeze
  end

  def with_instrument(new_instrument)
    self.class.new(bpm: bpm,
                   title: title,
                   instruments: instruments.dup.push(new_instrument))
  end

  def step_length
    ((60.0 / bpm) * 4.0) / 8.0
  end

  def play
    STDOUT.sync = true
    puts "Playing '#{title}' at #{bpm} BPM"
    seq = Sequence.new(instruments)
    current_step = 0
    # I don't particularly like infinite loops but the requirements
    # don't seem to have the same hesitance
    loop do
      print "\n|" if current_step % 8 == 0
      print "#{seq.next}|"
      current_step += 1
      sleep step_length
    end
    puts 'Finished playing song.'
  end
end
