require_relative 'sales_tax'

module Calculate
  class ImportDuty < SalesTax
    @tax_rate_percentage = 5
  end
end
