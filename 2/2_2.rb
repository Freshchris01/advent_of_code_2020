lines = File.readlines('2.txt')

count = 0
lines.each do |line|
  idx1 = (line.split(' ')[0].split('-')[0]).to_i
  idx2 = (line.split(' ')[0].split('-')[1]).to_i

  char = line.split(' ')[1][0]
  pw = line.split(' ')[2]

  count += 1 if (pw[idx1 - 1] == char) ^ (pw[idx2 - 1] == char)
end

puts "Result: #{count}"
