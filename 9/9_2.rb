lines = File.readlines('9.txt').map(&:to_i)
target_value = 542_529_149

max_index = lines.find_index(target_value)

lower_index = 0
upper_index = 1

loop do
  while upper_index < max_index
    sum = lines[lower_index...upper_index].sum
    break if sum > target_value

    if sum == target_value
      puts "Result: #{lines[lower_index...upper_index].max + lines[lower_index...upper_index].min}"
      exit
    end
    upper_index += 1
  end
  lower_index += 1
end
