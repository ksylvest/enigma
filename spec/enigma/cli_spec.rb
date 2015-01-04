require 'spec_helper'

describe Enigma::CLI do

  let (:input) { double('input') }
  let (:output) { double('output') }
  let (:cli) { Enigma::CLI.new(input: input, output: output) }

  describe "#parse" do

    it "stubs to slop" do
      expect(Slop).to receive(:parse)
      expect(output).to receive(:puts)
      expect(input).to receive(:gets) { "Turing" }
      cli.parse()
    end

    it "supports '-v' or '--version' flag" do
      options = double('options')
      expect(output).to receive(:puts)
      expect(options).to receive(:banner=)

      allow(options).to receive(:on) do |s, l, &block|
        block.call if s.eql?('-v') or s.eql?('--version')
      end

      expect(Slop).to receive(:parse) do |&block|
        block.call(options)
      end

      cli.parse()
    end

    it "supports '-h' or '--help' flag" do
      options = double('options')
      expect(output).to receive(:puts)
      expect(options).to receive(:banner=)

      allow(options).to receive(:on) do
        |s, l, &block| block.call if s.eql?('-h') or s.eql?('--help')
      end

      expect(Slop).to receive(:parse) do |&block|
        block.call(options)
      end

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
