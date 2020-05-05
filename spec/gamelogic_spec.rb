require './lib/gamelogic.rb'
require './lib/player.rb'
require './lib/board.rb'

describe GameLogic do
  include Board
  let(:player1) { Player.new('Fernando', 'X') }
  let(:player2) { Player.new('Luis', 'O') }
  let(:game) { GameLogic.new(player1, player2) }

  describe '#win' do
    it 'Returns true for player 1 (Fernando) when his board positions are 1, 4, 7' do
      player1.add_pos('1')
      player1.add_pos('4')
      player1.add_pos('7')

      expect(game.win).to eql(player1.name)
    end

    it 'Returns false for player 2 (Luis) when player1 (Fernando) has board positions 1, 4, 7' do
      player1.add_pos('1')
      player1.add_pos('4')
      player1.add_pos('7')

      expect(game.win).not_to eql(player2.name)
    end
  end

  describe '#initialize_board' do
    it 'Returns the clean drawn board' do
      expect(game.initialize_board).to eql(["    |   |    \n  1 | 2 | 3  \n____|___|____",
                                            "    |   |    \n  4 | 5 | 6  \n____|___|____",
                                            "    |   |    \n  7 | 8 | 9  \n____|___|____"])
    end
  end

  describe '#validate' do
    it 'Returns true for the position 3' do
      expect(game.validate(3)).to eql(true)
    end

    it 'Returns false for input greater than 9' do
      expect(game.validate(15)).to eql(false)
    end

    it 'Returns false for input different than number' do
      expect(game.validate('q')).to eql(false)
    end
  end

  describe '#round' do
    it 'Returns the drawn board for player1 with positions 1, 5, 8 and player2 positions 4, 7, 9' do
      player1.add_pos('1')
      player1.add_pos('5')
      player1.add_pos('8')

      player2.add_pos('4')
      player2.add_pos('7')

      expect(game.round(5, '9')).to eql(["    |   |    \n  X | 2 | 3  \n____|___|____",
                                         "    |   |    \n  O | X | 6  \n____|___|____",
                                         "    |   |    \n  O | X | O  \n____|___|____"])
    end
  end

  describe '#game_over' do
    it 'Returns true when game is finished' do
      expect(game.game_over).to eql(true)
    end
  end

  describe '#game_finished' do
    it 'Returns the state of the game as true when finished' do
      game.game_over
      expect(game.game_finished).to eql(true)
    end

    it 'Returns the state of the game as false when the game is not finished' do
      expect(game.game_finished).to_not eql(true)
    end
  end
end
