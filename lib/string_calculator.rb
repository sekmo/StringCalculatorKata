class StringCalculator
  def self.add(input)
    numbers = numbers_from(input)
    return numbers.reduce(0) { |m,e| m + e }
  end

  def self.numbers_from(string)
    string.split(/[\n,]/).map(&:to_i)
  end
end
