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

    attr_accessor :mappings

    def initialize()
      self.mappings = {}
    end

    def plug(a,b)
      self.mappings[a] = b
      self.mappings[b] = a
    end

    def swap(character)
      self.mappings[character] || character
    end

  end
end