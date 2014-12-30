require 'slop'

module Enigma
  class CLI

    def initialize
      Slop.parse do |options|
        options.on '-v', '--version', 'version' do
          puts ::Enigma::VERSION
          exit
        end
      end
    end

  end
end
