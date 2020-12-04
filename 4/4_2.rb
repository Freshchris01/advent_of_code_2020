passports = File.read('4.txt').split("\n\n")

def is_valid?(passport)
  delimiters = [' ', "\n", ':']
  key_value = passport.split(Regexp.union(delimiters))

  i = 0
  while i < key_value.length - 1
    key = key_value[i]
    value = key_value[i + 1]

    case key
    when 'byr'
      return false if value.to_i < 1920 || value.to_i > 2002
    when 'iyr'
      return false if value.to_i < 2010 || value.to_i > 2020
    when 'eyr'
      return false if value.to_i < 2020 || value.to_i > 2030
    when 'hgt'
      unit = value[value.length - 2...value.length]
      height_value = value[0..-3].to_i
      case unit
      when 'cm'
        return false if height_value < 150 || height_value > 193
      when 'in'
        return false if height_value < 59 || height_value > 76
      else
        return false
      end
    when 'hcl'
      return false if value.length != 7
      return false unless value.match(/^#([a-f]|[0-9])/)
    when 'ecl'
      return false unless %w[amb blu brn gry grn hzl oth].include?(value)
    when 'pid'
      return false if value.length != 9
      return false unless value.match(/[0-9]/)
    end

    i += 2
  end

  true
end

counter = 0
passports.each do |passport|
  if %w[byr iyr eyr hgt hcl ecl pid].all? { |s| passport.include? s }
    counter += is_valid?(passport) ? 1 : 0
  end
end
puts "Total number of valid passports: #{counter}"
