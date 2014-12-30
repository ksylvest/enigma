require 'enigma'

describe Enigma::Reflector do

  let (:rotor) { Enigma::Rotor.new }
  let (:alphabet) { Enigma::ALPHABET }

  describe "#map" do
    it "maps every letter to a letter and is able to unmap that letter back to the original" do
      alphabet.each do |letter|
        expect(rotor.unmap(rotor.map(letter))).to eql(letter)
      end
    end
  end

end
