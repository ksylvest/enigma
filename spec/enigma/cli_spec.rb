require 'spec_helper'

describe Enigma::CLI do
  let(:input) { double('input') }
  let(:output) { double('output') }
  let(:cli) { Enigma::CLI.new(input: input, output: output) }

  describe '#parse' do
    %w[-v --version].each do |option|
      it "supports '#{option}' option" do
        expect(output).to receive(:puts).with Enigma::VERSION
        cli.parse([option])
      end
    end

    %w[-h --help].each do |option|
      it "supports '#{option}'" do
        expect(output).to receive(:puts).with <<~DEBUG
          usage: enigma [options] ...
              -h, --help     help
              -v, --version  version
        DEBUG
        cli.parse([option])
      end
    end

    it 'defaults to mapping input to output' do
      expect(input).to receive(:gets) { 'ENIGMA' }
      expect(output).to receive(:puts).with('AJMKDD')
      cli.parse([])
    end
  end
end
