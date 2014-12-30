module Enigma
  class Rotor
    attr_accessor :mappings
    attr_accessor :position
    attr_accessor :default
    attr_accessor :notches

    module Mappings
      DEFAULT = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
      A = %w(D M T W S I L R U Y Q N K F E J C A Z B P G X O H V)
      B = %w(H Q Z G P J T M O B L N C I F D Y A W V E U S R K X)
      C = %w(U Q N T L S Z F M R E H D P X K I B V Y G J C W O A)
    end

    module Notches
      DEFAULT = 0
      A = 1
      B = 2
      C = 3
    end

    def initialize(mappings: Mappings::DEFAULT, notches: Notches::DEFAULT)
      self.mappings = mappings
      self.notches = notches
    end

    def rotate
    
    end

    def map(letter)
      self.mappings[ALPHABET.index(letter)]
    end

    def reset!
      self.position = self.default
    end

    ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    ROTORS = [
      self.new(mappings: Mappings::A, notches: Notches::A),
      self.new(mappings: Mappings::B, notches: Notches::B),
      self.new(mappings: Mappings::C, notches: Notches::C),
    ]

  end
end