require_relative 'tax_receipt'

describe TaxReceipt do
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
      tr = TaxReceipt.new(input)
      expected_output = expected_outputs[i]
      expect(tr.receipt).to eq(expected_output)
    end
  end
end
