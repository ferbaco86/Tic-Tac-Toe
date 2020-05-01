module Board
  def draw(player1_pos, player2_pos)
    p player1_pos, player2_pos
    3.times do
      puts "    |   |    "
      puts "  1 | 2 | 3  "  
      puts "____|___|____"
    end
  end
end