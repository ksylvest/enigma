require 'enigma/cli'

describe Enigma::CLI do

  let (:input) { double('input') }
  let (:output) { double('output') }
  let (:cli) { Enigma::CLI.new(input: input, output: output) }

  describe "#initialize" do

    it "converts input to output using the streams" do
      expect(input).to receive(:gets) { "Turing" }
      expect(output).to receive(:puts)
      cli.parse()
    end

  end

end
