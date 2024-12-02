input = File.read File.join(File.dirname(__FILE__), 'input')

def part_1(input)
  input.each_line.reduce(0) do |sum, line|
    report = line.split.map(&:to_i)
    sum += is_safe(report) ? 1 : 0
  end
end

def part_2(input)
  input.each_line.reduce(0) do |sum, line|
    report = line.split.map(&:to_i)
    sum += is_safe_dampened(report) ? 1 : 0
  end
end

def is_safe(report)
  if (report != report.sort && report.reverse != report.sort) || report != report.uniq
    return false
  end

  (0...report.size-1).each do |i|
    if (report[i] - report[i+1]).abs > 3
      return false
    end
  end
  return true
end

def is_safe_dampened(report)
  (0...report.size).each do |i|
    if is_safe(report[0...i] + report[i+1...report.size])
      return true
    end
  end
  return false
end

p part_1 input
p part_2 input
