input = File.read File.join(File.dirname(__FILE__), "input")

def part_1(input)
  input.each_line.map do |line|
    digits = line.scan(/\d+/).join
    [digits[0], digits[-1]].join.to_i
  end.sum
end

def part_2(input)
  digit_map = %w(one two three four five six seven eight nine).map.with_index{|d, i| [d, i+1]}.to_h
  digit_pattern = /(?=(\d|#{digit_map.keys.join('|')}))/

  input.each_line.map do |line|
    digits = line.scan(digit_pattern).flatten.map do |digit|
      digit_map.fetch(digit, digit.to_i)
    end
    [digits[0], digits[-1]].join.to_i
  end.sum
end

p part_1 input
p part_2 input
