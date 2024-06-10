require 'parse/line'
# require 'calculate/sales_tax'
# require 'calculate/import_duty'
require 'tax_receipt/line_item'

module TaxReceipt
  class Creator
    attr_reader :input

    def initialize(txt)
      @input = txt
    end

    def receipt
      data = input.split("\n")
        .map { |line| Parse::Line.new(line) }
        .map { |parsed_line| LineItem.new(parsed_line) }
      
      sum_total = data.map { |line| line.total }.sum
      total_tax = data.map { |line| line.quantity * (line.sales_tax.to_i + line.import_duty.to_i) }.compact.sum
      line_items = data.map { |line| format_line(line) }.join("\n")

      "#{line_items}\nSales Taxes: #{format_currency total_tax}\nTotal: #{format_currency sum_total}"
    end

    def format_line(data)
      "#{data.quantity} #{data.description}: #{format_currency data.total}"
    end

    def format_currency(number)
      sprintf("%.2f", number / 100.0)
    end
  end
end
