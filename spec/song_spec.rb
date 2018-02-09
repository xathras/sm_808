# frozen_string_literal: true

require 'song'

RSpec.describe Song do
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
end
