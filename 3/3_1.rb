# frozen_string_literal: true
board = File.readlines('3.txt').map do |line|
  line.chomp.split('')
end

tree_counts = []
[[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].each do |val|
  step_x, step_y = val
  pos_x, pos_y = val

  tree_count = 0
  while pos_y < board.length
    line = board[pos_y]

    tree_count += 1 if line[pos_x % line.length] == '#'
    pos_y += step_y
    pos_x += step_x
  end
  tree_counts << tree_count
end
puts "#{tree_counts.inject(:*).to_s} trees"

