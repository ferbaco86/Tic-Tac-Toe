require './lib/player.rb'

describe Player do
  let(:player) {Player.new("Luis","X")}
  
  describe "#add_pos" do
    it "Returns an array of squares selected by the player" do
      expect(player.add_pos(5)).to eql([5])
    end
  end

  describe "#check_winner" do
    it "Returns true if there is a winner for a player occupying the top three board positions" do
      player.add_pos('1')
      player.add_pos('2')
      player.add_pos('3')
    
      expect(player.check_winner).to eql(true)

    end

    it "Returns true if there is a winner for a player occupying the diagonal board positions 1, 5, 9" do
      player.add_pos('1')
      player.add_pos('5')
      player.add_pos('9')
    
      expect(player.check_winner).to eql(true)

    end

    it "Returns false if for a player occupying the 1, 4, 3  board positions" do
      player.add_pos('1')
      player.add_pos('4')
      player.add_pos('3')
    
      expect(player.check_winner).to eql(false)

    end
  end
end