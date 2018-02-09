require 'forwardable'

class Sequence
  extend Forwardable
  def_delegators :@enum, :take, :each, :next, :lazy

  def initialize(instruments)
    @instruments = instruments
    @enum = Enumerator.new do |yielder|
      counter = 1
      loop do
        active_instruments = instruments.select { |i| i.on?(counter) }
        if active_instruments.empty?
          yielder << '_'
        else
          yielder <<  active_instruments.map(&:name).join('+')
        end
        counter += 1
      end
    end
  end
end
