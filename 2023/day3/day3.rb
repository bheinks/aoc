input = File.read File.join(File.dirname(__FILE__), "input")

def is_symbol?(char)
  "*%$@&+/#=-".include? char
end

def borders_symbol?(input_arr, row_length, part_num, start_row, start_col)
  # Left
  if start_col > 0
    if is_symbol? input_arr[start_row][start_col-1]
      return true
    end
  end

  # Right
  col = start_col + part_num.length
  if col < row_length
    if is_symbol? input_arr[start_row][col]
      return true
    end
  end

  # Above
  if start_row > 0
    (start_col-1..start_col+part_num.length).each do |col|
      if col >= 0 && col < row_length
        if is_symbol? input_arr[start_row-1][col]
          return true
        end
      end
    end
  end

  # Below
  if start_row < input_arr.length-1
    (start_col-1..start_col+part_num.length).each do |col|
      if col >= 0 && col < row_length
        if is_symbol? input_arr[start_row+1][col]
          return true
        end
      end
    end
  end

  return false
end

def part_1(input)
  input_arr = input.split.map{|l| l.chars}
  row_length = input_arr[0].length

  input.delete("\n").enum_for(:scan, /\d+/).map do |part_num|
    position = Regexp.last_match.begin(0)
    row, col = position.divmod(row_length)

    if borders_symbol? input_arr, row_length, part_num, row, col
      part_num.to_i
    else
      0
    end
  end.sum
end

p part_1 input
