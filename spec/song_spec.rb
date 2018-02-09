require 'song'

RSpec.describe Song do
  it 'should not let you add instruments directly' do
    song = Song.new(bpm: 60, name: 'Test Song')

    expect { song.instruments.push 'test' }.to raise_error(RuntimeError, "can't modify frozen Array")
  end

  it 'should let you add an instrument' do
    song = Song.new(bpm: 60, name: 'Test Song')

    song = song.with_instrument 'test'

    expect(song.instruments.count).to eq(1)
  end
end
