adapters = File.readlines('10.txt').map(&:to_i)

adapters.sort!
counter = [0, 1, 0, 1]
(1...adapters.length).each do |i|
  difference = adapters[i] - adapters[i - 1]
  counter[difference] += 1
end
puts "Result is: #{counter[1] * counter[3]}"
