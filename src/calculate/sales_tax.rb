require 'bigdecimal'

module Calculate
  class SalesTax
    @@tax_rate_percentage = 10
    
    class << self
      def calculate(price)
        round_up @@tax_rate_percentage * price / 100
      end

      # "The rounding rules for sales tax are that for a tax rate of n%,
      # a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.
      def round_up(price)
        (BigDecimal(price) / 5).ceil * 5
      end
    end
  end
end
