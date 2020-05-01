module Board
  def draw(player1_pos, player2_pos)
    arr = []
    p player1_pos
    for i in (1..9)
      if player1_pos.include?(i.to_s)
        arr << 'X'
      elsif player2_pos.include?(i.to_s)
        arr << 'O'
      else
        arr << i.to_s
      end
    end

    [0,3,6].each do |n|
      puts "    |   |    "
      puts "  #{arr[n]} | #{arr[n+1]} | #{arr[n+2]}  "  
      puts "____|___|____"
    end
  end
end