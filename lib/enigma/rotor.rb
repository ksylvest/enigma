module Enigma

  # The engima rotor has two contact points and can transform a letter going
  # forward or reverse. In addition the rotor supports rotating (offsetting)
  # and has a turnover point that will change other rotors
  #
  # Usage:
  #
  #   rotor = Enigma::Rotor.new(mapping: ..., turnover: ..., position: ...)
  #   rotor.forward('A') # '.'
  #   rotor.reverse('B') # '.'
  #   rotor.rotate and return unless rotor.turnover?
  #
  class Rotor

    module Mappings
      DEFAULT = ALPHABET
      A = %w(E K M F L G D Q V Z N T O W Y H X U S P A I B R C J)
      B = %w(A J D K S I R U X B L H W T M C Q G Z N P Y F V O E)
      C = %w(B D F H J L C P R T X V Z N Y E I W G A K M U S Q O)
      D = %w(E S O V P Z J A Y Q U I R H X L N F T G K D C M W B)
      E = %w(V Z B R G I T Y U P S D N H L X A W M J Q O F E C K)
    end

    module Turnover
      DEFAULT = 0
      A = Mappings::A.index('R')
      B = Mappings::B.index('F')
      C = Mappings::C.index('W')
      D = Mappings::D.index('K')
      E = Mappings::E.index('A')
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

    def self.rotors
      [
        new(mappings: Mappings::A, turnover: Turnover::A),
        new(mappings: Mappings::B, turnover: Turnover::B),
        new(mappings: Mappings::C, turnover: Turnover::C),
      ]
    end

  end
end