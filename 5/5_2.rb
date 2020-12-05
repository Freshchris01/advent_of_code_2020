passes = File.readlines('5.txt')

available_seats = (0...890).to_a
passes.each do |pass|
  pass = pass.strip.gsub('F', '0').gsub('B', '1').gsub('L', '0').gsub('R', '1')
  row = pass[0...7].to_i(2)
  column = pass[7...10].to_i(2)
  seat_id = row * 8 + column
  available_seats -= [seat_id]
end

puts "The empty seat ID is: #{available_seats.max}"
