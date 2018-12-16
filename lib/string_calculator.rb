class StringCalculator
  STANDARD_DELIMITERS = ["\n", ","]
  NUMBERS_AND_DELIMITERS_REGEX = /(?:\/\/(.)\n)?(.*)/m

  def self.add(input)
    numbers = numbers_from(input)
    negatives = negatives_in(numbers)
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
    return numbers.reduce(0) { |m,e| m + e }
  end

  def self.negatives_in(numbers)
    numbers.select { |number| number < 0}
  end

  def self.numbers_from(string)
    numbers_subtring = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[2]
    small_numbers_from(numbers_subtring.split(/[#{delimiters_from(string).join}]/).map(&:to_i))
  end

  def self.small_numbers_from(numbers)
    numbers.select { |n| n <= 1000 }
  end

  def self.delimiters_from(string)
    custom_delimiter = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[1]
    return STANDARD_DELIMITERS + [custom_delimiter].compact
  end
end
