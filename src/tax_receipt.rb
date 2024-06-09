class TaxReceipt
  attr_reader :input

  def initialize(txt)
    @input = txt
  end

  def receipt
    input
  end
end
