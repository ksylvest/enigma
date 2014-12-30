module Enigma
  class Machine
    SEPARATOR = ''

    attr_accessor :rotors

    def initialize(rotors: Rotor::ROTORS)
      self.rotors = rotors
    end

    def convert(string)
      string.split(SEPARATOR).map { |character| character }.join(SEPARATOR)
    end

    def reset!
      self.rotors.each do |rotor|
        rotor.reset!
      end
    end

  end
end