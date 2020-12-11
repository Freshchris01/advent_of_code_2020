adapters = File.readlines('10_1_medium.txt').map(&:to_i)

adapters.sort!

def get_numbers_between(old_number, new_number, adapters)
  old_index = adapters.find_index(old_number)
  new_index = adapters.find_index(new_number)

  return adapters[old_index...new_index - 1].length
end

def get_permutations(input)
  return 4 if input == 2
  return 2 if input == 1
end
puts adapters
sum = 1 # Count adjacent numbers

index = 0
old_number = adapters[0]
while true
  next_number = nil
  [3,2,1].each do |i|
    next_number = adapters[index] + i
    break if adapters.find_index(next_number) != nil
  end
  index = adapters.find_index(next_number)
  break if index == nil

  #puts "Next number is: #{next_number}"
  #puts "#{get_numbers_between(old_number, next_number, adapters)} numbers between #{old_number} and #{next_number}"
  sum *= get_permutations(get_numbers_between(old_number, next_number, adapters)) if (get_numbers_between(old_number, next_number, adapters)) != 0

  old_number = next_number
end

puts "Sum is #{sum}"
