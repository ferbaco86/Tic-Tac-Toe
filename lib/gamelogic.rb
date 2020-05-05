class GameLogic
  require_relative '../lib/board'
  include Board

  attr_reader :game_finished

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_finished = false
    @continue_playing = true
  end

  def win
    return @player1.name if @player1.check_winner
    return @player2.name if @player2.check_winner

    nil
  end

  def initialize_board
    draw(@player1.pos, @player2.pos)
  end

  def validate(pos)
    if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(pos.to_i) && !@player1.pos.include?(pos) && !@player2.pos.include?(pos)
      return true
    end

    false
  end

  def round(round_num, pos)
    @player1.add_pos(pos) if round_num.even?
    @player2.add_pos(pos) if round_num.odd?
    draw(@player1.pos, @player2.pos)
  end

  def game_over
    @game_finished = true
  end
end
