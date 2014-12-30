require 'enigma'

describe Enigma do

  let (:enigma) { Enigma }

  describe ".convert" do
    it "converts a string" do
      expect(Enigma.convert('TURING')).to_not eql('TURING')
    end
  end

end
