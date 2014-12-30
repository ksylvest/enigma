require 'enigma/alphabet'
require 'enigma/machine'
require 'enigma/reflector'
require 'enigma/rotor'
require 'enigma/plugboard'
require 'enigma/cli'

module Enigma
  def self.convert(string)
    Machine.new.convert(string)
  end
end
