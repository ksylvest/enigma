require 'slop'

module Enigma
  class CLI

    attr_accessor :machine
    attr_accessor :input
    attr_accessor :output

    def initialize(input: STDIN, output: STDOUT)
      self.machine = Machine.new
      self.input  = input
      self.output = output
    end

    def parse
      Slop.parse do |options|
        options.banner = "usage: enigma [options] ..."

        options.on '-h', '--help' do
          help(options)
          return
        end

        options.on '-v', '--version' do
          version(options)
          return
        end

      end

      convert
    end

  private

    def help(options = {})
      self.output.puts(options)
    end

    def version(options = {})
      self.output.puts(::Enigma::VERSION)
    end

    def convert
      self.output.puts(self.machine.convert(self.input.gets.chomp))
    end

  end
end
