require 'enigma/alphabet'
require 'enigma/cli'
require 'enigma/machine'
require 'enigma/plugboard'
require 'enigma/reflector'
require 'enigma/rotor'

module Enigma
  def self.convert(string)
    Machine.new.convert(string)
  end
end
