commands = File.readlines('12.txt').map do |line|
  line = [line[0,1].to_sym, line[1, line.length].strip.to_i]
  line
end

DIRECTIONS = %i[E S W N].freeze

position = { N: 0, E: 0 }
direction = :E

def move(direction, amount, position)
  case direction
  when :S
    direction = :N
    amount *= -1
  when :W
    direction = :E
    amount *= -1
  end
  position[direction] += amount
  position
end

commands.each do |command|
  case command[0]
  when :F
    position = move(direction, command[1], position)
  when :R
    current = DIRECTIONS.find_index(direction)
    steps = command[1] / 90
    direction = DIRECTIONS[(current + steps) % 4]
  when :L
    current = DIRECTIONS.find_index(direction)
    steps = command[1] / 90
    direction = DIRECTIONS[(current - steps) % 4]
  else
    position = move(command[0], command[1], position)
  end
end

puts "Manhattan distance is: #{position[:E].abs + position[:N].abs}"
