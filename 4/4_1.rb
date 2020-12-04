passports = File.read('4.txt').split("\n\n")

counter = 0
passports.each do |passport|
  counter += 1 if %w[byr iyr eyr hgt hcl ecl pid].all? { |s| passport.include? s }
end
puts counter
