require 'sequence'
require 'instrument'

RSpec.describe Sequence do
  it 'should have the instrument on the correct step' do
    instrument = Instrument.new 'Kick', '|X|_|_|_|X|_|_|_|'
    sequence = Sequence.new([instrument])

    steps = sequence.take(8)
    expect(steps).to eq(%w[Kick _ _ _ Kick _ _ _])
  end

  it 'should support multiple instruments on the same step' do
    kick = Instrument.new 'Kick', '|X|_|_|_|X|_|_|_|'
    snare = Instrument.new 'Snare', '|_|_|_|_|X|_|_|_|'
    sequence = Sequence.new([kick, snare])

    steps = sequence.take(8)

    expect(steps).to eq(%w[Kick _ _ _ Kick+Snare _ _ _])
  end
end
