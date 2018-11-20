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
      A = %w[E K M F L G D Q V Z N T O W Y H X U S P A I B R C J].freeze
      B = %w[A J D K S I R U X B L H W T M C Q G Z N P Y F V O E].freeze
      C = %w[B D F H J L C P R T X V Z N Y E I W G A K M U S Q O].freeze
    end

    module Turnover
      DEFAULT = 0
      A = Mappings::A.index('R')
      B = Mappings::B.index('F')
      C = Mappings::C.index('W')
    end

    module Position
      DEFAULT = 0
    end

    module Offset
      DEFAULT = 0
    end

    def initialize(mappings: Mappings::DEFAULT, turnover: Turnover::DEFAULT, position: Position::DEFAULT)
      @mappings = mappings
      @turnover = turnover
      @position = position
      reset!
    end

    def rotate
      @offset = @offset.next % ALPHABET.length
      self
    end

    def turnover?
      ((@position + @offset) % ALPHABET.length).eql?(@turnover)
    end

    def forward(letter)
      return letter unless ALPHABET.include?(letter)

      @mappings[(ALPHABET.index(letter) + @position + @offset) % ALPHABET.length]
    end

    def reverse(letter)
      return letter unless ALPHABET.include?(letter)

      ALPHABET[(@mappings.index(letter) + @position - @offset) % ALPHABET.length]
    end

    def reset!
      @offset = Offset::DEFAULT
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
