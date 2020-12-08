commands = File.readlines('8.txt')

commands = commands.collect do |command|
  command = command.split(' ')
  command[1] = command[1].to_i
  command
end

acc = 0
current_line = 0
sequence = [current_line]

loop do
  current_command = commands[current_line]

  case current_command[0]
  when 'nop'
    current_line += 1
  when 'acc'
    acc += current_command[1]
    current_line += 1
  when 'jmp'
    current_line += current_command[1]
  end

  break if sequence.include?(current_line)

  sequence << current_line
end


puts "Accumulator value: #{acc}"
