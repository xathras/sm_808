require 'song'

RSpec.describe Song do
  it 'should not let you add instruments directly' do
    song = Song.new(bpm: 60, title: 'Test Song')

    expect { song.instruments.push 'test' }.to raise_error(RuntimeError, "can't modify frozen Array")
  end

  it 'should let you add an instrument' do
    song = Song.new(bpm: 60, title: 'Test Song')

    song = song.with_instrument 'test'

    expect(song.instruments.count).to eq(1)
  end

  it 'should calculate the number of seconds per step' do
    song = Song.new bpm: 60, title: 'Test Song'

    expect(song.step_length).to eq(0.5)
  end
end
