module Enigma

  # The engima reflector is used to scramble the input. It takes input,
  # performs a substituion, then returns output. The scramling functions
  # such that if 'A' maps to 'B' then 'B' maps to 'A' (thus allowing for both
  # encrypting and decrypting).
  #
  # Usage:
  #
  #   reflector = Enigma::Reflector.new
  #   machine.reflect('A') # 'B'
  #   machine.reflect('B') # 'A'
  #   ...
  #
  class Reflector

    module Mappings
      ENCRYPTED = %w(Y R U H Q S L D P X N G O K M I E B F Z C W V J A T)
    end

    module Position
      DEFAULT = 0
    end

    attr_accessor :mappings
    attr_accessor :position

    def initialize(mappings: Mappings::ENCRYPTED, position: Position::DEFAULT)
      self.mappings = mappings
      self.position = position
    end

    def reflect(letter)
      return letter unless ALPHABET.include?(letter)
      ALPHABET[(self.mappings.index(letter) + self.position) % ALPHABET.length]
    end

  end
end