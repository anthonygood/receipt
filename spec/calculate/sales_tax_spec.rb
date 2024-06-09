require 'calculate/sales_tax'

describe Calculate::SalesTax do
  subject { Calculate::SalesTax }

  describe "round_up" do
    it "rounds up to the nearest 5 pennies" do
      expect(subject.round_up(0)).to eq(0)
      expect(subject.round_up(1)).to eq(5)

      expect(subject.round_up(5)).to eq(5)
      expect(subject.round_up(6)).to eq(10)

      expect(subject.round_up(99)).to eq(100)
      expect(subject.round_up(100)).to eq(100)

      expect(subject.round_up(101)).to eq(105)
      expect(subject.round_up(104)).to eq(105)
      expect(subject.round_up(105)).to eq(105)

      expect(subject.round_up(106)).to eq(110)

      expect(subject.round_up(1049)).to eq(1050)
      expect(subject.round_up(189)).to eq(190)
    end
  end

  it "calculates the sales tax, rounded up to the nearest 5 pennies" do
    expect(subject.calculate(1499)).to eq(150)
    expect(subject.calculate(1899)).to eq(190)
  end
end
