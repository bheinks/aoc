input = File.read File.join(File.dirname(__FILE__), 'input')

def part_1(input)
  input.scan(/mul\((\d+),(\d+)\)/).map { |pair| pair.map(&:to_i).reduce(:*) }.sum
end

def part_2(input)
  ("do()" + input.gsub("\n", "") + "don't()").scan(/do\(\)(.+?)don't\(\)/).flatten.map { |section| part_1(section) }.sum
end

p part_1 input
p part_2 input
