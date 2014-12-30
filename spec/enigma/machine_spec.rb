require 'enigma'

describe Enigma::Machine do

  let (:string) { 'TURING' }
  let (:machine) { Enigma::Machine.new }

  describe "#convert" do

    it 'is unique' do
      a = machine.convert(string)
      b = machine.convert(string)
      expect(a).to_not eql(b)
    end
  
    it 'is distinct' do
      expect(machine.convert(string)).to_not eql(string)
    end

  end

  describe "#reset!" do

    it 'is resetable' do
      a = machine.reset!.convert(string)
      b = machine.reset!.convert(string)
      expect(a).to eql(b)
    end

    it 'can decrypt an encryption' do
      expect(machine.reset!.convert(machine.convert(string))).to eql(string)
    end

  end

end
