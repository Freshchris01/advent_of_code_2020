old_board = File.readlines("11.txt").map do |line|
  line.chomp.split("").map(&:to_s)
end

def next_step_empty_seat(line, field, board)
  (-1...2).each do |x|
    (-1...2).each do |y|
      next if x.zero? && y.zero?
      next if (line + x).negative? || line + x >= board.length
      next if (field + y).negative? || field + y >= board[x].length
      return 'L' if board[line + x][field + y] == '#'
    end
  end
  '#'
end

def next_step_occupied_seat(line, field, board)
  adjacent_count = 0
  (-1...2).each do |x|
    (-1...2).each do |y|
      next if x.zero? && y.zero?
      next if (line + x).negative? || line + x >= board.length
      next if (field + y).negative? || field + y >= board[x].length

      adjacent_count += 1 if board[line + x][field + y] == '#'
    end
  end

  if adjacent_count >= 4
    'L'
  else
    '#'
  end
end

def count_occupied_seats(board)
  counter = 0
  board.each do |line|
    line.each do |field|
      counter += 1 if field == '#'
    end
  end

  counter
end

new_board = []
pre = 0

loop do
  old_board.each_with_index do |line, line_index|
    new_board << []
    line.each_with_index do |field, field_index|
      if field == '.'
        new_board[line_index] << '.'
        next
      elsif field == 'L'
        new_board[line_index] << next_step_empty_seat(line_index, field_index, old_board)
      else
        new_board[line_index] << next_step_occupied_seat(line_index, field_index, old_board)
      end
    end
  end

  break if count_occupied_seats(old_board) == count_occupied_seats(new_board)

  puts "Occupied seats: #{ count_occupied_seats(new_board)}"
  old_board = new_board.clone.map(&:clone)
  new_board = []
end
