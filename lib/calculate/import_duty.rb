require_relative 'sales_tax'

module Calculate
  class ImportDuty
    extend SalesTax
    @@tax_rate_percentage = 5
  end
end
