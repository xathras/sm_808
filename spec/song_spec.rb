# frozen_string_literal: true

require 'song'

RSpec.describe Song do
  class MockBuffer
    def initialize
      @buffer = StringIO.new
    end

    def print(str)
      @buffer.write(str)
    end

    def contents
      @buffer.string
    end
  end

  it 'should not let you add instruments directly' do
    song = Song.new('Test Song', 60)

    expect { song.instruments.push 'test' }.to raise_error(RuntimeError, "can't modify frozen Array")
  end

  it 'should let you add an instrument' do
    song = Song.new('Test Song', 60)

    song = song.with_instrument 'test'

    expect(song.instruments.count).to eq(1)
  end

  it 'should calculate the number of seconds per step' do
    song = Song.new('Test Song', 60)

    expect(song.step_duration).to eq(0.5)
  end

  it 'should output an entire line' do
    song = Song.new('Test Song', 1000, [Instrument.new('Kick', '|X|_|_|_|X|_|_|_|')])
    buffer = MockBuffer.new

    song.play(buffer, 8)

    expect(buffer.contents).to eq("\n|Kick|_|_|_|Kick|_|_|_|")
  end

  it 'should output multiple lines' do
    song = Song.new('Test Song', 1000, [Instrument.new('Kick', '|X|_|_|_|X|_|_|_|')])
    buffer = MockBuffer.new

    song.play(buffer, 16)

    expect(buffer.contents).to eq("\n|Kick|_|_|_|Kick|_|_|_|\n|Kick|_|_|_|Kick|_|_|_|")
  end
end
