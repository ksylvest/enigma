require 'spec_helper'

describe Enigma::Plugboard do

  let(:plugboard) { Enigma::Plugboard.new }

  describe '#swap' do
    it 'swaps a character after plugging' do
      plugboard.plug('A', 'B')
      expect(plugboard.swap('A')).to eql('B')
      expect(plugboard.swap('B')).to eql('A')
    end
  end

end
