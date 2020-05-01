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
    draw(@player1.pos, @player2.pos)
  end

  def win
    return @player1.name if @player1.check_winner
    return @player2.name if @player2.check_winner
    return nil
  end

  def validate(pos)
    return true if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(pos) && !@player1.pos.include?(pos) && !@player2.pos.include?(pos)
    false
  end

  def round (round_num, pos)
    @player1.add_pos(pos) if round_num % 2 == 0
    @player2.add_pos(pos) if round_num % 2 != 0
    p @player1.pos
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