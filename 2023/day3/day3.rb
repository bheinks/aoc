input = File.read File.join(File.dirname(__FILE__), "input")

def is_symbol?(char)
  "*%$@&+/#=-".include? char
end

def neighbors_symbol?(input_arr, row_length, part_num, start_row, start_col, gears)
  neighbor_found = false

  # Left
  if start_col > 0
    char = input_arr[start_row][start_col-1]
    if is_symbol? char
      neighbor_found = true
      gears[[start_row, start_col-1]] += [part_num.to_i] if char == "*"
    end
  end

  # Right
  col = start_col + part_num.length
  if col < row_length
    char = input_arr[start_row][col]
    if is_symbol? char
      neighbor_found = true
      gears[[start_row, col]] += [part_num.to_i] if char == "*"
    end
  end

  # Above
  if start_row > 0
    (start_col-1..start_col+part_num.length).each do |col|
      if col >= 0 && col < row_length
        char = input_arr[start_row-1][col]
        if is_symbol? char
          neighbor_found = true
          gears[[start_row-1, col]] += [part_num.to_i] if char == "*"
        end
      end
    end
  end

  # Below
  if start_row < input_arr.length-1
    (start_col-1..start_col+part_num.length).each do |col|
      if col >= 0 && col < row_length
        char = input_arr[start_row+1][col]
        if is_symbol? char
          neighbor_found = true
          gears[[start_row+1, col]] += [part_num.to_i] if char == "*"
        end
      end
    end
  end

  return neighbor_found
end

def solve(input)
  input_arr = input.split.map{|l| l.chars}
  row_length = input_arr[0].length
  sum = 0
  gears = Hash.new []

  input.delete("\n").enum_for(:scan, /\d+/).map do |part_num|
    position = Regexp.last_match.begin(0)
    row, col = position.divmod(row_length)

    if neighbors_symbol? input_arr, row_length, part_num, row, col, gears
      sum += part_num.to_i
    end
  end

  p sum
  p gears.filter_map { |k, v| v[0] * v[1] if v.length == 2 }.sum
end

solve input
