require_relative 'line'

describe Parse::Line do
  subject { Parse::Line.new("1 book at 12.49") }

  it "parses the quantity" do
    expect(subject.quantity).to eq(1)
  end

  it "parses the amount in pennies" do
    expect(subject.amount).to eq(1249)
  end

  it "parses the description" do
    expect(subject.description).to eq("book")
  end

  it "parses the imported flag" do
    expect(subject.imported).to eq(false)
  end

  it "parses the category" do
    expect(subject.category).to eq("book")
  end

  it "parses whether tax exempt" do
    expect(subject.tax_exempt).to eq(true)
  end
end