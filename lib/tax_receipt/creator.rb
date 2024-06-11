require 'parse/line'
require 'tax_receipt/line_item'

# Upon reflection, "SalesReceipt" might be a better name for this module
module TaxReceipt
  class Creator
    attr_reader :input

    class << self
      def create(txt)
        new(txt).receipt
      end
    end

    def initialize(txt)
      raise "No input provided" if txt.empty?

      # TODO: Validate input
      @input = txt
    end

    def data
      @data ||= input
        .split("\n")
        .map { |line| Parse::Line.new line }
        .map { |parsed_line| LineItem.new parsed_line }
    end

    def receipt      
      sum_total = data.map(&:total).sum
      total_tax = data.map(&:total_tax).sum
      line_items = data.map(&method(:format_line)).join "\n"

      "#{line_items}\nSales Taxes: #{format_currency total_tax}\nTotal: #{format_currency sum_total}"
    end

    def format_line(data)
      "#{data.quantity} #{data.description}: #{format_currency data.total}"
    end

    def format_currency(number)
      format "%.2f", number / 100.0
    end
  end
end
