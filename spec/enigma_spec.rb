require 'enigma'

describe Enigma do

  let (:machine) { Enigma::Machine.new }

  it "" do
    expect(machine.convert("TURING")).to eql("TURING")
  end

end