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

    def total_tax
      quantity * (sales_tax.to_i + import_duty.to_i)
    end

    private

    def sales_tax
      if parsed_line.tax_exempt?
        0
      else
        Calculate::SalesTax.calculate(parsed_line.price)
      end
    end

    def import_duty
      if parsed_line.imported
        Calculate::ImportDuty.calculate(parsed_line.price)
      else
        0
      end
    end
  end
end
