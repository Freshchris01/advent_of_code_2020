#adapters = File.readlines('10_1_medium.txt').map(&:to_i)
adapters = File.readlines('10_1_small.txt').map(&:to_i)

adapters.sort!

def get_previous_combinations(next_index, adapters)
  return 1 if next_index == adapters.length - 1 # found a valid permutation
  return 0 if next_index >= adapters.length # not a valid permutation

  sum = 0

  (1...4).each do |i|
    next_number = adapters[next_index] + i
    sum += get_previous_combinations(adapters.find_index(next_number), adapters) if adapters.include?(next_number)
  end
  sum

end

puts "Result is: #{get_previous_combinations(0, adapters)}"


