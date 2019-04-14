require "./spec_helper"

describe Erupt do
  # TODO: Write tests
  it "works" do
    string = ""
    output = String.build() do |str|
      erupt = Erupt::Erupt.new(str, Logger::DEBUG, "Erupt")
      erupt.info("Testing this")
    end
    output.should contain("[Erupt]")
    output.should contain("INFO")
    output.should contain(Emoji.emojize(":information_source:"))
    output.should contain("Testing this")
  end
end
