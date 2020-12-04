# frozen_string_literal: true
numbers = File.readlines('1_2.txt').map(&:to_i)
for x in 0..numbers.size - 1
  for y in 0..numbers.size - 1
    for z in 0..numbers.size - 1 
      sum = numbers[x] + numbers[y] + numbers[z]
      if sum == 2020
        puts "Result is: #{numbers[x] * numbers[y] * numbers[z]}"
      end
    end
  end
end