# frozen_string_literal: true

require 'sequence'

class Song
  attr_reader :title, :bpm, :instruments

  SECONDS_PER_MINUTE = 60.0
  PATTERN_STEPS = 8.0

  def initialize(title, bpm, instruments = [])
    @title = title
    @bpm = bpm
    @instruments = instruments.freeze
  end

  def with_instrument(new_instrument)
    self.class.new(title,
                   bpm,
                   instruments.dup.push(new_instrument))
  end

  def step_duration
    ((SECONDS_PER_MINUTE / bpm) * 4.0) / PATTERN_STEPS
  end

  def play(device)
    # STDOUT.sync = true
    device.puts "Playing '#{title}' at #{bpm} BPM"
    seq = Sequence.new(instruments)
    current_step = 0
    # I don't particularly like infinite loops but the requirements
    # don't seem to have the same hesitance
    loop do
      device.print "\n|" if current_step % 8 == 0
      device.print "#{seq.next}|"
      current_step += 1
      sleep step_duration
    end
  end
end
