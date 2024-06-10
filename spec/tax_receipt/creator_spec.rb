require 'spec_helper'
require 'tax_receipt/creator'

describe TaxReceipt::Creator do
  inputs = [
    File.read("spec/fixtures/input_1.txt"),
    File.read("spec/fixtures/input_2.txt"),
    File.read("spec/fixtures/input_3.txt")
  ]

  expected_outputs = [
    File.read("spec/fixtures/output_1.txt"),
    File.read("spec/fixtures/output_2.txt"),
    File.read("spec/fixtures/output_3.txt")
  ]

  inputs.each_with_index do |input, i|
    it "returns the expected output for input_#{i + 1}" do
      tr = TaxReceipt::Creator.create(input)
      expected_output = expected_outputs[i]

      expect(tr).to eq(expected_output)
    end
  end

  it "throws a helpful error message when no input is provided" do
    expect { TaxReceipt::Creator.create("") }.to raise_error("No input provided")
  end
end
