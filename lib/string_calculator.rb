class StringCalculator
  STANDARD_DELIMITERS = ["\n", ","]

  def self.add(input)
    numbers = numbers_from(input)
    return numbers.reduce(0) { |m,e| m + e }
  end

  def self.numbers_from(string)
    numbers_subtring = string.match(/\/\/.\n(.*)/).to_a[1] || string
    numbers_subtring.split(/[#{delimiters_from(string).join}]/).map(&:to_i)
  end

  def self.delimiters_from(string)
    custom_delimiter = string.match(/\/\/(.)/).to_a[1]
    return STANDARD_DELIMITERS + [custom_delimiter].compact
  end
end
