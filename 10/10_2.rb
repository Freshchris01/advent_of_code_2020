adapters = File.readlines('10_1_medium.txt').map(&:to_i)
#adapters = File.readlines('10_1_small.txt').map(&:to_i)

adapters.sort!

def get_previous_combinations(next_index, adapters, level, current_list)
  #puts "Level: #{level}, Checking index: #{next_index}"
  #current_list << adapters[next_index]

  #puts "Current list: #{current_list}" if next_index == 0
  return 1 if next_index == 0
  return 0 if next_index < 0

  sum = 0

  (1...4).each do |i|
    next_number = adapters[next_index] - i
    sum += get_previous_combinations(adapters.find_index(next_number), adapters, level+1, current_list) if adapters.include?(next_number)
  end
  sum

end

puts "Result is: #{get_previous_combinations(adapters.length - 1, adapters, 0, [])}"


