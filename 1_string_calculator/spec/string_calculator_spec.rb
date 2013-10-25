require 'spec_helper'

describe StringCalculator do

  before :each do
    @string_calculator = StringCalculator.new
  end

  describe "#add" do
    
    it "takes a string as an argument" do
      @string_calculator.add("").should_not raise_exception
    end

    it "won't take an integer as an argument" do
      expect {@string_calculator.add(1)}.to raise_error(RuntimeError, "Must be a string")
      # lambda {@string_calculator.add(1)}.should raise_error(RuntimeError, "Must be a string")
    end

    it "returns zero for an empty string" do
      @string_calculator.add("").should eql 0
    end

    it "returns single integer if passed one-length string" do
      @string_calculator.add("2").should eql 2
    end

    it "returns the sum of numbers passed in a string" do
      @string_calculator.add("1, 2").should eql 3
    end

    it "accepts strings with numbers divided by either a comma or a newline" do
      @string_calculator.add("1,2\n3,4").should eq 10
    end

    it "supports different delimiters" do
      @string_calculator.add("//&\n1&2&3").should eq 6
    end

    it "returns an error with the negative number when passed a negative number" do
      lambda {@string_calculator.add("1,2,3,-4")}.should raise_error(RuntimeError, "Negatives not allowed, -4")
    end

    it "ignores numbers larger than 999" do
      @string_calculator.add("1,2,3000").should eq 3
    end

    it "should allow delimiters to be any length" do
      @string_calculator.add("//&&&\n1&&&2&&&3").should eq 6
    end

    it "should allow multiple delimiters" do
      @string_calculator.add("//&*\n1&2*3").should eq 6
    end

    it "should allow multiple delimiters with length more than one character" do
      @string_calculator.add("//&**\n1&2**3").should eq 6
    end

  end

end