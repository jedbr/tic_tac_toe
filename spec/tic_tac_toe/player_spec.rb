require 'tic_tac_toe/player'

describe TicTacToe::Player do
  subject(:player) { TicTacToe::Player.new("jed", "X") }
  
  describe "#initialize" do
    it "initializes object with name and player mark" do
      expect(player.name).to eq("jed")
      expect(player.mark).to eq("X")
    end
  end
end
