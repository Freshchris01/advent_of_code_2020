numbers = File.readlines('1.txt').map(&:to_i)
for i in 0..numbers.size - 1
  first = numbers[i].to_i
  second = 2020 - first
  if numbers.include?(second)
    puts "Result is: #{first * second}"
    break
  end
end
