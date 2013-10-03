class FreqWords
  attr_reader :k, :text

  def initialize(k, text)
    #noinspection RubyInstanceVariableNamingConvention
    @k = k
    @text = text
  end

  def output
    result = Hash.new(0)
    max = 0

    @text.chars.each_index do |index|
      break if index + @k > @text.length
      key = @text[index, @k].to_sym

      result[key] += 1

      max = result[key] > max ? result[key] : max
    end

    result.delete_if { |key, value| value != max }.keys.map { |k| k.to_s }
  end
end

#lines = File.readlines('stepic_dataset.txt')
#p FreqWords.new(lines[1].to_i, lines[0]).output