require 'bigdecimal'

module Calculate
  class SalesTax
    @tax_rate_percentage = 10
    
    class << self
      attr_reader :tax_rate_percentage

      def calculate(price)
        total = (tax_rate_percentage * price) / 100
        round_up total
      end

      # "The rounding rules for sales tax are that for a tax rate of n%,
      # a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.
      def round_up(price)
        (BigDecimal(price) / 5).ceil * 5
      end
    end
  end
end
