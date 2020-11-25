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
    SEPARATOR = ''.freeze

    def initialize(rotors: Rotor.rotors, reflector: Reflector.new, plugboard: Plugboard.new)
      @rotors = rotors
      @reflector = reflector
      @plugboard = plugboard
    end

    def convert(string)
      format(string).split(SEPARATOR).map { |character| process(character) }.join(SEPARATOR)
    end

    def reset!
      @rotors.each(&:reset!)
    end

  private

    def process(character)
      rotate

      [
        method(:plug),
        method(:forward),
        method(:reflect),
        method(:reverse),
        method(:plug),
      ].reduce(character) { |current, operation| operation.call(current) }
    end

    def format(string)
      string.upcase
    end

    def plug(character)
      @plugboard.swap(character)
    end

    def reflect(character)
      @reflector.reflect(character)
    end

    def forward(character)
      @rotors.inject(character) do |memo, rotor|
        rotor.forward(memo)
      end
    end

    def reverse(character)
      @rotors.reverse.inject(character) do |memo, rotor|
        rotor.reverse(memo)
      end
    end

    def rotate
      @rotors.each do |rotor|
        rotor.rotate
        break unless rotor.turnover?
      end
    end

  end
end
