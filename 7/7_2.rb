lines = File.readlines('7.txt')

lines = lines.collect do |line|
  splitted = line.split('contain')
  splitted[0] = splitted[0].strip.sub('bags', '').strip
  splitted[1] = splitted[1].strip.sub('.', '').gsub(/( bags| bag)/, '').strip.split(', ')
  splitted
end

def get_full_bag(bag_name, lines)
  lines.each do |line|
    return line if line[0] == bag_name
  end
end

# find starting bag
start = get_full_bag('shiny gold', lines)

def get_number_of_bags(current_bag, lines)
  return 1 if current_bag[1][0].include?('no other')
  
  sum = 1
  current_bag[1].each do |bag|
    splitted_bag = bag.split(' ', 2)
    sum += splitted_bag[0].to_i * get_number_of_bags(get_full_bag(splitted_bag[1], lines), lines)
  end
  puts "Current bag: #{current_bag[0]}, sum: #{sum}"
  sum
end

result = get_number_of_bags(start, lines)
puts "Result is: #{result}"
