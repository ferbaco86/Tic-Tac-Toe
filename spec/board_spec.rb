require './lib/board.rb'
require './lib/player.rb'

describe Board do
  include Board
  let(:player1) { Player.new('Fernando', 'X') }
  let(:player2) { Player.new('Luis', 'O') }
  describe '#draw' do
    it 'Returns the drawn board for player1 with positions 1, 5, 8 and player2 positions 4, 7, 9' do
      player1.add_pos('1')
      player1.add_pos('5')
      player1.add_pos('8')

      player2.add_pos('4')
      player2.add_pos('7')
      player2.add_pos('9')

      expect(draw(player1.pos, player2.pos)).to eql(["    |   |    \n  X | 2 | 3  \n____|___|____",
                                                     "    |   |    \n  O | X | 6  \n____|___|____",
                                                     "    |   |    \n  O | X | O  \n____|___|____"])
    end

    it 'Returns the drawn board for player1 with positions 1, 5, 9 and player2 positions 4, 7, 8' do
      player1.add_pos('1')
      player1.add_pos('5')
      player1.add_pos('9')

      player2.add_pos('4')
      player2.add_pos('7')
      player2.add_pos('8')

      expect(draw(player1.pos, player2.pos)).to eql(["    |   |    \n  X | 2 | 3  \n____|___|____",
                                                     "    |   |    \n  O | X | 6  \n____|___|____",
                                                     "    |   |    \n  O | O | X  \n____|___|____"])
    end

    it 'Returns the drawn board for player1 with positions 1, 6, 9 and player2 positions 2, 5, 8' do
      player1.add_pos('1')
      player1.add_pos('6')
      player1.add_pos('9')

      player2.add_pos('2')
      player2.add_pos('5')
      player2.add_pos('8')

      expect(draw(player1.pos, player2.pos)).to eql(["    |   |    \n  X | O | 3  \n____|___|____",
                                                     "    |   |    \n  4 | O | X  \n____|___|____",
                                                     "    |   |    \n  7 | O | X  \n____|___|____"])
    end
  end
end
