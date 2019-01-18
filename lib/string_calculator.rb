class StringCalculator
  STANDARD_DELIMITERS = ["\n", ","]
  NUMBERS_AND_DELIMITERS_REGEX = /(?:\/\/(?:(.)|(\[(?:.*)\])+)\n)?(.*)/m

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
    numbers_subtring = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[3]
    small_numbers_from(numbers_subtring.split(/[#{delimiters_from(string).join}]/).map(&:to_i))
  end

  def self.small_numbers_from(numbers)
    numbers.select { |n| n <= 1000 }
  end

  def self.delimiters_from(string)
    delimiters_match = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[1..2]
    custom_delimiter = delimiters_match[0]
    custom_delimiters_in_square_brackets = delimiters_match[1] && delimiters_match[1][1..-2].split("][")
    return [*STANDARD_DELIMITERS, custom_delimiter, *custom_delimiters_in_square_brackets].compact
  end
end
