input = File.read File.join(File.dirname(__FILE__), 'input')

def part_1(left, right)
  left.sort.zip(right.sort).map { |l, r| (l - r).abs }.sum
end

def part_2(left, right)
  left.reduce(0) { |sum, n| sum += n * right.count(n) }
end

left = []
right = []
input.each_line do |l|
  n1, n2 = l.split
  left.append n1.to_i
  right.append n2.to_i
end

p part_1 left, right
p part_2 left, right
