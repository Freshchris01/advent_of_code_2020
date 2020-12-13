old_board = File.readlines('11.txt').map do |line|
  line.chomp.split('').map(&:to_s)
end

def print_board(board)
  board.each do |line|
    line2 = ''
    line.each do |field|
      line2 += field
    end
    puts line2
  end
end

def next_step_empty_seat(line, field, board)
  (-1...2).each do |multiply_x|
    (-1...2).each do |multiply_y|
      next if multiply_x.zero? && multiply_y.zero?

      fields_to_add = 1

      loop do
        new_x = line + fields_to_add * multiply_x
        new_y = field + fields_to_add * multiply_y

        break if new_x.negative? || new_x >= board.length
        break if new_y.negative? || new_y >= board[new_x].length
        break if board[new_x][new_y] == 'L'
        return 'L' if board[new_x][new_y] == '#'
        
        fields_to_add += 1
      end
    end
  end
  '#'
end

def next_step_occupied_seat(line, field, board)
  adjacent_count = 0
  (-1...2).each do |multiply_x|
    (-1...2).each do |multiply_y|
      next if multiply_x.zero? && multiply_y.zero?

      fields_to_add = 1

      loop do
        new_x = line + fields_to_add * multiply_x
        new_y = field + fields_to_add * multiply_y

        break if new_x.negative? || new_x >= board.length
        break if new_y.negative? || new_y >= board[new_x].length
        break if board[new_x][new_y] == 'L'
        
        if board[new_x][new_y] == '#'
          adjacent_count += 1
          break
        end
        fields_to_add += 1
      end
    end
  end

  if adjacent_count >= 5
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
  #print_board(new_board) # print board to debug
  old_board = new_board.clone.map(&:clone)
  new_board = []
end
