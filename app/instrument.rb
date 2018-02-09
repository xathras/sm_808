# frozen_string_literal: true

class Instrument
  attr_reader :name

  def initialize(name, signature)
    @name = name
    @beats = signature
             .split('|')
             .reject(&:empty?)
             .map.with_index { |c, idx| [c, idx + 1] }
             .reject { |c, _idx| c == '_' }.map(&:last)
  end

  def on?(beat)
    @beats.reduce(false) { |found, b|
      next found if found
      beat == b || beat % 8 == b
    }
  end
end
