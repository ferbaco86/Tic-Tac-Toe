class GameLogic
  require_relative '../lib/board'
  include Board

  attr_reader :game_finished
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_finished = false
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

    if round_num >= 5
      unless win.nil?
        puts "Good game! It was a close one. The victory goes to #{win}"
        game_over(true)
      end
    end
  end

  def game_over(is_finished)
    @game_finished = true
  end

  def play_game
    9.times do |round_num|
      game_logic.round(round_num, @player.pos)
    end
  end
end