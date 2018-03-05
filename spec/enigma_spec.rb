require 'spec_helper'

describe Enigma do

  let(:testing) { (0...256).map { Enigma::ALPHABET[rand(Enigma::ALPHABET.length)] }.join }
  let(:enigma) { Enigma }

  describe '.convert' do
    it 'converts a string' do
      expect(enigma.convert(testing)).to_not eql(testing)
    end
  end

end
