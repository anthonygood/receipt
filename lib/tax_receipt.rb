require 'parse/line'
require 'calculate/sales_tax'
require 'calculate/import_duty'

class TaxReceipt
  attr_reader :input

  def initialize(txt)
    @input = txt
  end

  def receipt
    data = input.split("\n")
      .map { |line| Parse::Line.new(line) }
      .map do |parsed_line|
        sales_tax = Calculate::SalesTax.calculate(parsed_line.amount) unless parsed_line.tax_exempt?
        import_duty = Calculate::ImportDuty.calculate(parsed_line.amount) if parsed_line.imported
        total = parsed_line.quantity * (parsed_line.amount + sales_tax.to_i + import_duty.to_i)
        {
          quantity: parsed_line.quantity,
          price: parsed_line.amount,
          description: parsed_line.description,
          sales_tax: sales_tax.to_i,
          import_duty: import_duty.to_i,
          total: total,
        }
      end
    
    sum_total = data.map { |line| line[:total] }.sum
    total_tax = data.map { |line| line[:quantity] * (line[:sales_tax] + line[:import_duty]) }.compact.sum
    line_items = data.map { |line| format_line(line) }.join("\n")

    "#{line_items}\nSales Taxes: #{format_currency total_tax}\nTotal: #{format_currency sum_total}"
  end

  def format_line(data)
    "#{data[:quantity]} #{data[:description]}: #{format_currency data[:total]}"
  end

  def format_currency(number)
    sprintf("%.2f", number / 100.0)
  end
end
