input = File.read(File.join(File.dirname(__FILE__), "input"))
digit_map = {
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
}
digit_pattern = /(?=(\d|#{digit_map.keys.join('|')}))/

def part_1(input)
    input.each_line.map do |line|
        digits = line.scan(/\d+/).join
        [digits[0], digits[-1]].join.to_i
    end.sum
end

def part_2(input, digit_pattern, digit_map)
    input.each_line.map do |line|
        digits = line.scan(digit_pattern).flatten.map do |digit|
            digit_map.fetch(digit, digit.to_i)
        end
        [digits[0], digits[-1]].join.to_i
    end.sum
end

p part_1 input
p part_2 input, digit_pattern, digit_map
