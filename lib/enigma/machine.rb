module Enigma

  # The machine is composed of a number of rotors, a reflector, a plugboard and
  # can encrypt a regular string or decrypt a converted string. Conversion is
  # run through the same method for enciphering or deciphering as long as the
  # machine is configured identically.
  #
  # Usage:
  #
  #   machine = Enigma::Machine.new
  #   machine.convert('TURING') # '.....'
  #   machine.reset!
  #   machine.convert('.....') # 'TURING'
  class Machine
    SEPARATOR = ''

    attr_accessor :rotors
    attr_accessor :reflector
    attr_accessor :plugboard

    def initialize(rotors: Rotor.rotors, reflector: Reflector.new, plugboard: Plugboard.new)
      self.rotors = rotors
      self.reflector = reflector
      self.plugboard = plugboard
    end

    def convert(string)
      format(string).split(SEPARATOR).map { |character| process(character) }.join(SEPARATOR)
    end

    def reset!
      self.rotors.each do |rotor|
        rotor.reset!
      end
    end

  private

    def process(character)
      rotate

      character = plug(character)
      character = forward(character)
      character = reflect(character)
      character = reverse(character)
      character = plug(character)

      return character
    end

    def format(string)
      string.upcase
    end

    def plug(character)
      self.plugboard.swap(character)
    end

    def reflect(character)
      self.reflector.reflect(character)
    end

    def forward(character)
      self.rotors.inject(character) do |memo, rotor|
        rotor.forward(memo)
      end
    end

    def reverse(character)
      self.rotors.reverse.inject(character) do |memo, rotor|
        rotor.reverse(memo)
      end
    end

    def rotate
      self.rotors.each do |rotor|
        rotor.rotate
        break unless rotor.turnover?
      end
    end

  end
end