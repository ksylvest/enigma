# frozen_string_literal: true

require "spec_helper"

describe Enigma::Machine do
  let(:testing) { (0...256).map { Enigma::ALPHABET[rand(Enigma::ALPHABET.length)] }.join }

  describe "#convert" do
    it "is unique" do
      machine = described_class.new
      a = machine.convert(testing)
      b = machine.convert(testing)
      expect(a).not_to eql(b)
    end

    it "is distinct" do
      machine = described_class.new
      expect(machine.convert(testing)).not_to eql(testing)
    end
  end

  describe "#reset!" do
    it "is resetable" do
      machine = described_class.new
      a = machine.convert(testing)
      machine.reset!
      b = machine.convert(testing)
      expect(a).to eql(b)
    end

    it "can encrypt then decrypt" do
      machine = described_class.new
      encrypt = machine.convert(testing)
      machine.reset!
      decrypt = machine.convert(encrypt)
      expect(decrypt).to eql(testing)
    end
  end
end
