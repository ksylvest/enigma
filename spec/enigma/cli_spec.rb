# frozen_string_literal: true

require "spec_helper"

describe Enigma::CLI do
  let(:input) { instance_double(IO, gets: "ENIGMA") }
  let(:output) { instance_spy(IO) }
  let(:cli) { described_class.new(input:, output:) }

  describe "#parse" do
    %w[-v --version].each do |option|
      it "supports '#{option}' option" do
        cli.parse([option])
        expect(output).to have_received(:puts).with Enigma::VERSION
      end
    end

    %w[-h --help].each do |option|
      it "supports '#{option}'" do
        cli.parse([option])
        expect(output).to have_received(:puts).with <<~DEBUG
          usage: enigma [options] ...
              -h, --help     help
              -v, --version  version
        DEBUG
      end
    end

    it "defaults to mapping input to output" do
      cli.parse([])
      expect(output).to have_received(:puts).with("AJMKDD")
    end
  end
end
