require 'spec_helper'

describe Enigma::Rotor do

  let(:rotor) { Enigma::Rotor.new }
  let(:rotors) { Enigma::Rotor.rotors }
  let(:alphabet) { Enigma::ALPHABET }

  describe '#mapping' do
    it 'maps every letter to a letter and is able to unmap that letter back to the original' do
      alphabet.each do |letter|
        expect(rotor.reverse(rotor.forward(letter))).to eql(letter)
      end
    end

    it 'maps and unmaps to the same character after rotating' do
      alphabet.each do |letter|
        rotor.rotate
        expect(rotor.reverse(rotor.forward(letter))).to eql(letter)
      end
    end

    it 'maps through multiple rotors to the same character' do
      alphabet.each do |letter|
        result = letter
        rotors.each(&:rotate)
        rotors.each do |rotor|
          result = rotor.forward(result)
        end
        rotors.reverse_each do |rotor|
          result = rotor.reverse(result)
        end
        expect(result).to eql(letter)
      end
    end
  end

  describe '#rotate' do
    it 'maps to the same letter without rotation going forwards' do
      alphabet.each do |letter|
        expect(rotor.forward(letter)).to eql(rotor.forward(letter))
      end
    end

    it 'maps to a different letter after each rotation going forwards' do
      alphabet.each do |letter|
        expect(rotor.forward(letter)).to_not eql(rotor.rotate.forward(letter))
      end
    end

    it 'maps to the same letter without rotation going reversed' do
      alphabet.each do |letter|
        expect(rotor.reverse(letter)).to eql(rotor.reverse(letter))
      end
    end

    it 'maps to a different letter after each rotation going reversed' do
      alphabet.each do |letter|
        expect(rotor.reverse(letter)).to_not eql(rotor.rotate.reverse(letter))
      end
    end
  end

end
