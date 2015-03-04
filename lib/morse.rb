class Morse

  DOT = 'o'
  DASH = '-'

  ALPHABET = {
    :a => [DOT, DASH],
    :b => [DASH, DOT, DOT, DOT],
    :c => [DASH, DOT, DASH, DOT],
    :d => [DASH, DOT, DOT],
    :e => [DOT],
    :f => [DOT, DOT, DASH, DOT],
    :g => [DASH, DASH, DOT],
    :h => [DOT, DOT, DOT, DOT],
    :i => [DOT, DOT],
    :J => [DOT, DASH, DASH, DASH],
    :k => [DASH, DOT, DASH],
    :l => [DOT, DASH, DOT, DOT],
    :m => [DASH, DASH],
    :n => [DASH, DOT],
    :o => [DASH, DASH, DASH],
    :p => [DOT, DASH, DASH, DOT],
    :q => [DASH, DASH, DOT, DASH],
    :r => [DOT, DASH, DOT],
    :s => [DOT, DOT, DOT],
    :t => [DASH],
    :u => [DOT, DOT, DASH],
    :v => [DOT, DOT, DOT, DASH],
    :w => [DOT, DASH, DASH],
    :x => [DASH, DOT, DOT, DASH],
    :y => [DASH, DOT, DASH, DASH],
    :z => [DASH, DASH, DOT, DOT],
    0 => [DASH, DASH, DASH, DASH, DASH],
    1 => [DOT, DASH, DASH, DASH, DASH],
    2 => [DOT, DOT, DASH, DASH, DASH],
    3 => [DOT, DOT, DOT, DASH, DASH],
    4 => [DOT, DOT, DOT, DOT, DASH],
    5 => [DOT, DOT, DOT, DOT, DOT],
    6 => [DASH, DOT, DOT, DOT, DOT],
    7 => [DASH, DASH, DOT, DOT, DOT],
    8 => [DASH, DASH, DASH, DOT, DOT],
    9 => [DASH, DASH, DASH, DASH, DOT]
  }

  def self.split_string(str)
    raise TypeError, 'String expected' unless str.class == String
    response = []
    str.each_char do |c|
      case
      when self.fixnum?(c)
        response << Morse::ALPHABET[c.to_i]
      when self.string?(c)
        morse_char = Morse::ALPHABET[c.downcase.to_sym]
        if c == ' '
          response << ['       ']
        elsif morse_char == nil
          # nothing
        else
          response << morse_char
        end
      end
    end
    return response
  end

  def self.has_digits?(str)
    str.count("0-9") > 0
  end

  def self.fixnum?(val)
    return self.has_digits?(val) || val.class == Fixnum
  end

  def self.string?(val)
    return val.class == String
  end

  def self.convert_array_to_string(response)
    response_string = ''
    response.each do |i|
      i.each do |j|
        response_string << j
      end
      response_string << " "
    end
    return response_string
  end

  def self.to_morse (str)
    morse_array = self.split_string(str)
    morse_string = self.convert_array_to_string(morse_array)
  end

end
