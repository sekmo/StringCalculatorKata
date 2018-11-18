require 'string_calculator'

describe StringCalculator do
  describe 'add' do
    it 'returns 0 with an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number if the input is just one number' do
      expect(StringCalculator.add("42")).to eq(42)
    end
  end
end
