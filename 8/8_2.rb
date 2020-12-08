commands = File.readlines('8.txt')

commands = commands.collect do |command|
  command = command.split(' ')
  command[1] = command[1].to_i
  command
end

commands.each_with_index do |command, index|
  next if command[0] == 'acc'

  changed_commands = commands.map(&:clone)
  changed_commands[index][0] = command[0] == 'nop' ? 'jmp' : 'nop'
  
  acc = 0
  current_line = 0
  sequence = [current_line]

  loop do
    current_command = changed_commands[current_line]

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

    puts "End reached with accumulator value: #{acc}" if sequence.include?(changed_commands.length - 1)
  end
end

