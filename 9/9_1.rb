lines = File.readlines('9.txt').map(&:to_i)
preamble = 25

def sum_of_previous_numbers?(value, previous_numbers)
  previous_numbers.each do |first|
    second = value - first
    return true if previous_numbers.include?(second)
  end
  false
end

index = preamble

loop do
  break unless sum_of_previous_numbers?(lines[index], lines[index - preamble...index])

  index += 1
end

puts "Result is: #{lines[index]}"
