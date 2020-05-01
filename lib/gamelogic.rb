class GameLogic
  require_relative '../lib/board'
  include Board

  attr_reader :game_finished
  attr_reader :continue_playing
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_finished = false
    @continue_playing = true
  end

  def win
    return @player1.name if @player1.check_winner
    return @player2.name if @player2.check_winner
    return nil
  end

  def round (round_num, pos)
    @player1.add_pos(pos) if round_num % 2 == 0
    @player2.add_pos(pos) if round_num % 2 != 0
    draw(@player1.pos, @player2.pos)
  end

  def game_over
    @game_finished = true
  end

  def play_game
    round_num = 0
    while round_num < 10
      game_logic.round(round_num, @player.pos)
      if @game_finished
        round_num = 10
      else
        round_num += 1
      end
    end
  end

  def continue_playing? (user_input)
      @continue_playing = (user_input == 'Y'? true : false)
  end
end