require 'tic_tac_toe'
require 'spec_helper'

describe TicTacToe do
  subject { TicTacToe.new }
  let(:mark) { "O" }

  describe "#game_won?" do
    context "when someone wins," do
      context "board state:\nO - -\n- O -\n- - O\n" do
        it "returns true" do
          a = [[mark], [nil, mark], [nil, nil, mark]]
          subject.instance_variable_set(:@board, a)

          expect(subject.send(:game_won?)).to be
        end
      end

      context "board state:\n- - O\n- O -\nO - -\n" do
        it "returns true" do
          a = [[nil, nil, mark], [nil, mark], [mark]]
          subject.instance_variable_set(:@board, a)

          expect(subject.send(:game_won?)).to be
        end
      end

      context "board state:\nO - -\nO - -\nO - -\n" do
        it "returns true" do
          a = [[mark], [mark], [mark]]
          subject.instance_variable_set(:@board, a)

          expect(subject.send(:game_won?)).to be
        end
      end

      context "board state:\nO O O\n- - -\n- - -\n" do
        it "returns true" do
          a = [[mark, mark, mark], [], []]
          subject.instance_variable_set(:@board, a)

          expect(subject.send(:game_won?)).to be
        end
      end
    end

    context "when no one wins" do
      it "returns false" do
        expect(subject.send(:game_won?)).to be_falsey
      end
    end
  end
end
