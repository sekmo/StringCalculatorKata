class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = numbers_from(input)
    return numbers.reduce { |m,e| m + e }
  end

  def self.numbers_from(string)
    string.split(",").map(&:to_i)
  end
end
