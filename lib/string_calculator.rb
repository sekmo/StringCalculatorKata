class StringCalculator
  STANDARD_DELIMITERS = ["\n", ","]
  NUMBERS_AND_DELIMITERS_REGEX = /(?:\/\/(.)\n)?(.*)/m

  def self.add(input)
    numbers = numbers_from(input)
    return numbers.reduce(0) { |m,e| m + e }
  end

  def self.numbers_from(string)
    numbers_subtring = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[2]
    numbers_subtring.split(/[#{delimiters_from(string).join}]/).map(&:to_i)
  end

  def self.delimiters_from(string)
    custom_delimiter = string.match(NUMBERS_AND_DELIMITERS_REGEX).to_a[1]
    return STANDARD_DELIMITERS + [custom_delimiter].compact
  end
end
