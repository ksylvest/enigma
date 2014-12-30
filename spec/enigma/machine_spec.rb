require 'enigma'

describe Enigma::Machine do

  let (:machine) { Enigma::Machine.new }

  describe "#convert" do

    it 'is unique' do
      expect(machine.convert('TURING')).to_not eql(machine.convert('TURING'))
    end
  
    it 'is distinct' do
      expect(machine.convert('TURING')).to_not eql('TURING')
    end

  end

  describe "#reset!" do

    it 'is resetable' do
      expect(machine.reset!.convert('TURING')).to eql(machine.reset!.convert('TURING'))
    end

    it 'can decrypt an encryption' do
      expect(machine.reset!.convert(machine.convert('TURING'))).to eql('TURING')
    end

  end

end
