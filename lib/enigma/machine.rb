module Enigma
  class Machine
    SEPARATOR = ''

    attr_accessor :rotors
    attr_accessor :reflector

    def initialize(rotors: Rotor::ROTORS, reflector: Reflector.new)
      self.rotors = rotors
      self.reflector = reflector
    end

    def convert(string)
      string = string.split(SEPARATOR).map do |character|
        process(character)
      end
      string.join(SEPARATOR)
    end

    def reset!
      self.rotors.each do |rotor|
        rotor.reset!
      end
      return self
    end

  private

    def process(character)
      rotate

      self.rotors.each do |rotor|
        character = rotor.forward(character)
      end

      character = self.reflector.reflect(character)

      self.rotors.reverse.each do |rotor|
        character = rotor.reverse(character)
      end

      return character
    end

    def rotate
      self.rotors.each do |rotor|
        rotor.rotate
        break unless rotor.turnover?
      end
    end

  end
end