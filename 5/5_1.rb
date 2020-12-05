passes = File.readlines('5.txt')

max = 0
passes.each do |pass|
  pass = pass.strip.gsub('F', '0').gsub('B', '1').gsub('L', '0').gsub('R', '1')
  row = pass[0...7].to_i(2)
  column = pass[7...10].to_i(2)
  seat_id = row * 8 + column
  max = seat_id > max ? seat_id : max
end

puts "The max seat ID is: #{max}"
