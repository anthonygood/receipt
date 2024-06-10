require 'forwardable'

require 'calculate/sales_tax'
require 'calculate/import_duty'

module TaxReceipt
  class LineItem
    extend Forwardable
    attr_reader :parsed_input

    def_delegators :@parsed_input, :tax_exempt?, :quantity, :price, :description

    def initialize(parsed_input)
      @parsed_input = parsed_input
    end

    def total
      parsed_input.quantity * (parsed_input.price + sales_tax.to_i + import_duty.to_i)
    end

    def total_tax
      quantity * (sales_tax.to_i + import_duty.to_i)
    end

    private

    def sales_tax
      if parsed_input.tax_exempt?
        0
      else
        Calculate::SalesTax.calculate(parsed_input.price)
      end
    end

    def import_duty
      if parsed_input.imported
        Calculate::ImportDuty.calculate(parsed_input.price)
      else
        0
      end
    end
  end
end
