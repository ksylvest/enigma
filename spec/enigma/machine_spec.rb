require 'spec_helper'

describe Enigma::Machine do

  let(:testing) { (0...256).map { Enigma::ALPHABET[rand(Enigma::ALPHABET.length)] }.join }

  describe '#convert' do

    it 'is unique' do
      machine = Enigma::Machine.new
      a = machine.convert(testing)
      b = machine.convert(testing)
      expect(a).to_not eql(b)
    end

    it 'is distinct' do
      machine = Enigma::Machine.new
      expect(machine.convert(testing)).to_not eql(testing)
    end

  end

  describe '#reset!' do

    it 'is resetable' do
      machine = Enigma::Machine.new
      a = machine.convert(testing)
      machine.reset!
      b = machine.convert(testing)
      expect(a).to eql(b)
    end

    it 'can encrypt then decrypt' do
      machine = Enigma::Machine.new
      encrypt = machine.convert(testing)
      machine.reset!
      decrypt = machine.convert(encrypt)
      expect(decrypt).to eql(testing)
    end

  end

end
