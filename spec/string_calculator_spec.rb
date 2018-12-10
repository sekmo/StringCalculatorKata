require 'string_calculator'

describe StringCalculator do
  describe 'add' do
    it 'returns 0 with an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number if the input is just one number' do
      expect(StringCalculator.add("42")).to eq(42)
    end

    it 'returns the sum of the numbers if the input is two numbers' do
      expect(StringCalculator.add("42,5")).to eq(47)
    end

    it 'returns the sum of the numbers if the input is three numbers' do
      expect(StringCalculator.add("1,2,10")).to eq(13)
    end

    it 'returns the sum of the numbers if the input is six numbers' do
      expect(StringCalculator.add("5,5,10,2,8,2")).to eq(32)
    end

    it 'works also with new lines as delimiters' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'has configurable delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//+\n1+2")).to eq(3)
    end

    it 'throws exception with negative numbers' do
      expect { (StringCalculator.add("-1,2")) }.to raise_exception("negatives not allowed: -1")
      expect { (StringCalculator.add("//;\n-1;2;-6")) }.to raise_exception("negatives not allowed: -1, -6")
    end
  end

  describe 'delimiters_from' do
    it 'returns the delimiters including the custom one' do
      expect(StringCalculator.delimiters_from("//;\n1;2")).to eq(["\n", ",", ";"])
      expect(StringCalculator.delimiters_from("//+\n1+2")).to eq(["\n", ",", "+"])
      expect(StringCalculator.delimiters_from("1,2,3")).to eq(["\n", ","])
    end
  end

  describe 'negatives_from' do
    it "returns the negative numbers" do
      expect(StringCalculator.negatives_in([1, -1, 2, -5])).to eq([-1, -5])
    end
  end
end
