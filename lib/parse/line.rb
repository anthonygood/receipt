require_relative 'tax_category'

module Parse
  class Line
    attr_reader :input

    @@categories = [
      TaxCategory.new("food", ["chocolate"]),
      TaxCategory.new("book", ["book"]),
      TaxCategory.new("medical", ["pills"])
    ]

    def initialize(input)
      @input = input.strip
    end

    def quantity
      input.match(/^\d+/).to_s.to_i
    end

    def price
      input.match(/\d+\.\d{2}$/).to_s.gsub(".", "").to_i
    end

    def description
      input.match(/(?<=\d\s).+(?=\sat)/).to_s
    end

    def imported
      input.match(/imported/).to_s.empty? ? false : true
    end

    def category
      @@categories.each do |category|
        return category.name if category.match?(description)
      end

      nil
    end

    def tax_exempt?
      !!category
    end
  end
end
