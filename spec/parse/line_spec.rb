require 'parse/line'

describe Parse::Line do
  subject { Parse::Line.new("1 book at 12.49") }

  example_two = "1 bottle of perfume at 18.99"
  example_three = "3 imported boxes of chocolates at 11.25"

  it "parses the quantity" do
    expect(subject.quantity).to eq(1)

    expect(Parse::Line.new(example_two).quantity).to eq(1)
    expect(Parse::Line.new(example_three).quantity).to eq(3)
  end

  it "parses the amount in pennies" do
    expect(subject.amount).to eq(1249)

    expect(Parse::Line.new(example_two).amount).to eq(1899)
    expect(Parse::Line.new(example_three).amount).to eq(1125)
  end

  it "parses the description" do
    expect(subject.description).to eq("book")

    expect(Parse::Line.new(example_two).description).to eq("bottle of perfume")
    expect(Parse::Line.new(example_three).description).to eq("imported boxes of chocolates")
  end

  it "parses the imported flag" do
    expect(subject.imported).to eq(false)

    expect(Parse::Line.new(example_two).imported).to eq(false)
    expect(Parse::Line.new(example_three).imported).to eq(true)
  end

  it "parses the category" do
    expect(subject.category).to eq("book")

    expect(Parse::Line.new(example_two).category).to eq(nil)
    expect(Parse::Line.new(example_three).category).to eq("food")
  end

  it "parses whether tax exempt" do
    expect(subject.tax_exempt?).to eq(true)

    expect(Parse::Line.new(example_two).tax_exempt?).to eq(false)
    expect(Parse::Line.new(example_three).tax_exempt?).to eq(true)
  end
end
