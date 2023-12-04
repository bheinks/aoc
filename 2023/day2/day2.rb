MAX_RED_CUBES = 12
MAX_GREEN_CUBES = 13
MAX_BLUE_CUBES = 14
GAME_PATTERN = /\d+ (?:red|green|blue)/

input = File.read(File.join(File.dirname(__FILE__), "input"))

def game_possible?(line)
    game_id, games = line.split(": ")

    games.scan(GAME_PATTERN).each do |game|
        count, color = game.split
        count = count.to_i
        if (color == 'red' && count > MAX_RED_CUBES) ||
            (color == 'green' && count > MAX_GREEN_CUBES) ||
            (color == 'blue' && count > MAX_BLUE_CUBES)
            return 0
        end
    end

    game_id.split[1].to_i
end

def part_1(input)
    input.each_line.map do |line|
        game_possible? line
    end.sum
end

def calculate_cube_power(line)
    games = line.split(": ")[1]
    red_max, green_max, blue_max = 0, 0, 0

    games.scan(GAME_PATTERN).each do |game|
        count, color = game.split
        count = count.to_i
        if color == 'red' && count > red_max
            red_max = count
        elsif color == 'green' && count > green_max
            green_max = count
        elsif color == 'blue' && count > blue_max
            blue_max = count
        end
    end

    red_max * green_max * blue_max
end

def part_2(input)
    input.each_line.map do |line|
        calculate_cube_power line
    end.sum
end

p part_1 input
p part_2 input
