# frozen_string_literal: true

require 'instrument'

RSpec.describe Instrument do
  it 'should be able to tell you if it should be used on a given beat' do
    instrument = Instrument.new('Kick', '|X|_|_|_|X|_|_|_|')

    expect(instrument).to be_on(1)
    expect(instrument).not_to be_on(2)
    expect(instrument).not_to be_on(3)
    expect(instrument).not_to be_on(4)
    expect(instrument).to be_on(5)
    expect(instrument).not_to be_on(6)
    expect(instrument).not_to be_on(7)
    expect(instrument).not_to be_on(8)
    expect(instrument).to be_on(9)
    expect(instrument).not_to be_on(10)
    expect(instrument).not_to be_on(11)
    expect(instrument).not_to be_on(12)
    expect(instrument).to be_on(13)
  end

  it 'should handle instruments that are only used once per 8 beats' do
    instrument = Instrument.new('Snare', '|_|_|_|_|X|_|_|_|')

    expect(instrument).to be_on(5)
    expect(instrument).not_to be_on(6)
    expect(instrument).to be_on(13)
    expect(instrument).to be_on(21)
  end
end
