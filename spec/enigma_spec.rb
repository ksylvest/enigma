# frozen_string_literal: true

require "spec_helper"

describe Enigma do
  let(:testing) { (0...256).map { Enigma::ALPHABET[rand(Enigma::ALPHABET.length)] }.join }
  let(:enigma) { described_class }

  describe ".convert" do
    it "converts a string" do
      expect(enigma.convert(testing)).not_to eql(testing)
    end
  end
end
