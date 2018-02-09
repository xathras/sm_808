class Song
  attr_reader :name, :bpm, :instruments

  def initialize(name:, bpm:, instruments: [])
    @name = name
    @bpm = bpm
    @instruments = instruments.freeze
  end

  def with_instrument(new_instrument)
    self.class.new(bpm: bpm,
                   name: name,
                   instruments: instruments.dup.push(new_instrument))
  end
end
