groups = File.read('6.txt').split("\n\n")

total = 0

def answered_by_all_people?(group, question)
  group.each do |person|
    return false unless person.include?(question)
  end

  true
end

groups.each do |group|
  splitted_group = group.split("\n")
  already_checked_chars = []

  splitted_group.each do |person|
    person.chars.each do |answer|
      next if already_checked_chars.include?(answer)

      total += answered_by_all_people?(splitted_group, answer) ? 1 : 0
      already_checked_chars << answer
    end
  end
end
puts "Sum of answers: #{total}"
