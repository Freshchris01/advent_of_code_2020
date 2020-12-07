lines = File.readlines('7.txt')

lines = lines.collect do |line|
  splitted = line.split('contain')
  splitted[0] = splitted[0].strip.gsub(/( bags| bag)/, '').strip
  splitted
end

bags_with_gold = []

# find initial bags to process
lines.each do |line|
  bags_with_gold << line[0] if line[1].include?("shiny gold")
end

# process new bags until no new bags are found
old_length = -1
while old_length != bags_with_gold.length
  old_length = bags_with_gold.length
  lines.each do |line|
    if bags_with_gold.any? { |s| line[1].include? s }
      bags_with_gold << line[0] unless bags_with_gold.include?(line[0])
    end
  end
end
puts "Solution is: #{bags_with_gold.length}"
