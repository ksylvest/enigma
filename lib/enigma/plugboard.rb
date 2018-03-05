module Enigma

  # The engima plugboard is used to swap letters before and after the rotors
  # execute. It provided an additional layer of security increasing the
  # permutations.
  #
  # Usage:
  #
  #   reflector = Enigma::Reflector.new
  #   machine.reflect('A') # 'B'
  #   machine.reflect('B') # 'A'
  #   ...
  #
  class Plugboard

    def initialize
      @mappings = {}
    end

    def plug(character_a, character_b)
      @mappings[character_a] = character_b
      @mappings[character_b] = character_a
    end

    def swap(character)
      @mappings[character] || character
    end

  end
end
