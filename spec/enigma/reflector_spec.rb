require 'spec_helper'

describe Enigma::Reflector do

  let(:reflector) { Enigma::Reflector.new }
  let(:alphabet) { Enigma::ALPHABET }

  describe '#reflect' do

    it 'reflects every letter to a different letter' do
      alphabet.each do |letter|
        expect(reflector.reflect(letter)).to_not eql(letter)
      end
    end

    it 'reflects every letter to a different letter and then reflects that letter back to the original' do
      alphabet.each do |letter|
        expect(reflector.reflect(reflector.reflect(letter))).to eql(letter)
      end
    end

  end

end
