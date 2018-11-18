class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = numbers_from(input)
    return numbers.first if numbers.size == 1

    return numbers[0] + numbers[1] if numbers.size == 2
  end

  def self.numbers_from(string)
    string.split(",").map(&:to_i)
  end
end
