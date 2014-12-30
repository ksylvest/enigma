require 'enigma/alphabet'

module Enigma
  class Rotor

    module Mappings
      DEFAULT = ALPHABET
      A = %w(E K M F L G D Q V Z N T O W Y H X U S P A I B R C J).freeze
      B = %w(A J D K S I R U X B L H W T M C Q G Z N P Y F V O E).freeze
      C = %w(B D F H J L C P R T X V Z N Y E I W G A K M U S Q O).freeze
    end

    module Turnover
      DEFAULT = 0
      A = Mappings::A.index('Y')
      B = Mappings::B.index('M')
      C = Mappings::C.index('D')
    end

    module Position
      DEFAULT = 0
    end

    module Offset
      DEFAULT = 0
    end

    attr_accessor :mappings
    attr_accessor :turnover
    attr_accessor :position
    attr_accessor :offset

    def initialize(mappings: Mappings::DEFAULT, turnover: Turnover::DEFAULT, position: Position::DEFAULT)
      self.mappings = mappings
      self.turnover = turnover
      self.position = position
      reset!
    end

    def rotate
      self.offset = self.offset.next % ALPHABET.length
      return self
    end

    def turnover?
      ((self.position + self.offset) % ALPHABET.length).eql?(self.turnover)
    end

    def forward(letter)
      return letter unless ALPHABET.include?(letter)

      self.mappings[(ALPHABET.index(letter) + self.position + self.offset) % ALPHABET.length]
    end

    def reverse(letter)
      return letter unless ALPHABET.include?(letter)

      return ALPHABET[(self.mappings.index(letter) + self.position - self.offset) % ALPHABET.length]
    end

    def reset!
      self.offset = Offset::DEFAULT
    end

    ROTORS = [
      new(mappings: Mappings::A, turnover: Turnover::A),
      new(mappings: Mappings::B, turnover: Turnover::B),
      new(mappings: Mappings::C, turnover: Turnover::C),
    ]

  end
end