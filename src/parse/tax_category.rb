module Parse
  class TaxCategory
    attr_reader :name, :matches
    def initialize(name, matches)
      @name = name
      @matches = matches
    end

    def match?(description)
      matches.any? { |match| description.include?(match) }
    end
  end
end
