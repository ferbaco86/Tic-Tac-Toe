class Player\
 @name\
 @pos\
 @symbol\
 win_conditions = [] \
 def add_pos(pos)\
 def check_winner\
 \

- module Board\
   def draw\
   loop replace num with X or O\
  \
- class game_logic\
   include Board\
   player1 = Player.new(name, symbol)\
   player2 = Player.new(name, symbol)\
   def win \
   \
   def round(round_num, pos)\
   player.add_pos(pos)\
   Board.draw(player1.pos, player2.pos)\
  \
   if round => 5\
   return win if player.check_winner \
   end\
   \
   \
   def game_over(is_game_finished)
  @game_finished = true
  end
  \
  \
  \
  }
