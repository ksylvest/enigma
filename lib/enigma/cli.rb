require 'slop'

module Enigma

  # A wrapper for command line interaction that encompasses option parsing,
  # version, help and execution. This class is instantiated from the binary.
  #
  # Usage:
  #
  #   cli = Enigma::CLI.new
  #   cli.parse()
  #
  class CLI
    BANNER = 'usage: enigma [options] ...'.freeze

    def initialize(input: $stdin, output: $stdout)
      @machine = Machine.new
      @input = input
      @output = output
    end

    def parse(items = ARGV)
      Slop.parse(items) do |options|
        options.banner = BANNER

        options.on('-h', '--help', 'help') { return help(options) }
        options.on('-v', '--version', 'version') { return version }
      end

      execute
    end

  private

    def execute
      @output.puts(@machine.convert(@input.gets.chomp))
    end

    def help(options = {})
      @output.puts(String(options))
    end

    def version
      @output.puts(::Enigma::VERSION)
    end

  end
end
