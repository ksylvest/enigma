require 'enigma'

describe Enigma do

  let (:testing) { 'TURING' }
  let (:enigma) { Enigma }

  describe ".convert" do
    it "converts a string" do
      expect(enigma.convert(testing)).to_not eql(testing)
    end
  end

end
