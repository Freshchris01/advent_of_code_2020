groups = File.read('6.txt').split("\n\n")
groups = groups.map { |group| group.gsub("\n", '') }

total = 0

groups.each { |group| total += group.chars.uniq.length }
puts "Sum of answers: #{total}"
