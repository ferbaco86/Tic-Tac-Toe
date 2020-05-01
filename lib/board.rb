module Board
  def draw(player1_pos, player2_pos)
    arr = []
    (1..9).each do |i|
      arr << if player1_pos.include?(i.to_s)
               'X'
             elsif player2_pos.include?(i.to_s)
               'O'
             else
               i.to_s
             end
    end

    [0, 3, 6].each do |n|
      puts '    |   |    '
      puts "  #{arr[n]} | #{arr[n + 1]} | #{arr[n + 2]}  "
      puts '____|___|____'
    end
  end
end
