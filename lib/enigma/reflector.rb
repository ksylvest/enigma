require 'enigma/alphabet'

module Enigma
  class Reflector

    module Mappings
      ENCRYPTED = %w(Y R U H Q S L D P X N G O K M I E B F Z C W V J A T).freeze
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