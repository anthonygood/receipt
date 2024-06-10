require 'forwardable'

require 'calculate/sales_tax'
require 'calculate/import_duty'

module TaxReceipt
  class LineItem
    extend Forwardable
    attr_reader :parsed_line

    def_delegators :@parsed_line, :tax_exempt?, :quantity, :price, :description

    def initialize(parsed_line)
      @parsed_line = parsed_line
    end

    def total
      parsed_line.quantity * (parsed_line.price + sales_tax.to_i + import_duty.to_i)
    end

    def sales_tax
      Calculate::SalesTax.calculate(parsed_line.price) unless parsed_line.tax_exempt?
    end

    def import_duty
      Calculate::ImportDuty.calculate(parsed_line.price) if parsed_line.imported
    end
  end
end
