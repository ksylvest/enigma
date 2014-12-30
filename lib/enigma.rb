require 'enigma/machine'
require 'enigma/reflector'
require 'enigma/rotor'
require 'enigma/plugboard'

module Enigma
  ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).freeze

  def self.convert(string)
    machine = Machine.new
    machine.convert(string)
  end
end