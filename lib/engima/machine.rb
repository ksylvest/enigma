module Enigma
  class Machine

    attr_accessor :rotors

    def initialize(rotors)
      self.rotors = rotors || Rotor::ROTORS
    end

    def convert(string)
      string.split('').map do |character|
      
      end
    end

    def reset!
      self.rotors.each do |rotor|
        rotor.reset!
      end
    end

  end
end