lines = File.readlines('2.txt')

count = 0
lines.each do |line|
  min = (line.split(' ')[0].split('-')[0]).to_i
  max = (line.split(' ')[0].split('-')[1]).to_i

  char = line.split(' ')[1][0]
  pw = line.split(' ')[2]

  pw_count = pw.count(char)

  count += 1 if (pw_count >= min && pw_count <= max)
end

puts "Result: #{count}"
