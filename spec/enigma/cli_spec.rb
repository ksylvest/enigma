require 'spec_helper'

describe Enigma::CLI do

  let (:input) { double('input') }
  let (:output) { double('output') }
  let (:cli) { Enigma::CLI.new(input: input, output: output) }

  describe "#parse" do

    it "stubs to slop" do
      expect(Slop).to receive(:parse)
      expect(input).to receive(:gets) { "Turing" }
      expect(output).to receive(:puts)
      cli.parse()
    end

  end

  describe "#execute" do

    it "converts input to output using the streams" do
      expect(input).to receive(:gets) { "Turing" }
      expect(output).to receive(:puts)
      cli.execute()
    end

  end

end
