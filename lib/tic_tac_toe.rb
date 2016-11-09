require_relative 'tic_tac_toe/player'

class TicTacToe
  def initialize
    create_board
    create_players
    @turn = 0
    @winner = nil
    puts "Welcome to TicTacToe!"
  end

  def play
    while !game_won? && @turn < 9
      print_board
      @curr_player = @players[@turn % 2]
      puts "Turn: #{@turn + 1}, #{@curr_player.name}'s turn (#{@curr_player.mark})"
      make_move
      @turn += 1
    end
    finish_game
  end

  private

  def create_board
    @board = Array.new(3) { Array.new(3) }
  end

  def create_players
    @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
    @players.each do |player|
      puts "#{player.name} name:"
      player.name = gets.chomp
    end
  end

  def print_board
    i = 1
    @board.each do |column|
      column.each do |cell|
        cell.nil? ? print("#{i} ") : print("#{cell} ")
        i += 1
      end
      puts
    end
  end

  def game_won?
    @board.each do |column|
      if column == ["X", "X", "X"] || column == ["O", "O", "O"]
        return assign_winner
      end
    end

    if [@board[0][0], @board[1][0], @board[2][0]] == ["X", "X", "X"] ||
       [@board[0][0], @board[1][0], @board[2][0]] == ["O", "O", "O"]
      return assign_winner

    elsif [@board[0][1], @board[1][1], @board[2][1]] == ["X", "X", "X"] ||
          [@board[0][1], @board[1][1], @board[2][1]] == ["O", "O", "O"]
      return assign_winner

    elsif [@board[0][2], @board[1][2], @board[2][2]] == ["X", "X", "X"] ||
          [@board[0][2], @board[1][2], @board[2][2]] == ["O", "O", "O"]
      return assign_winner

    elsif [@board[0][0], @board[1][1], @board[2][2]] == ["X", "X", "X"] ||
       [@board[0][0], @board[1][1], @board[2][2]] == ["O", "O", "O"]
      return assign_winner

    elsif [@board[0][2], @board[1][1], @board[2][0]] == ["X", "X", "X"] ||
       [@board[0][2], @board[1][1], @board[2][0]] == ["O", "O", "O"]
      return assign_winner
    end

    return false
  end

  def assign_winner
    @winner = @curr_player
    return true
  end

  def make_move
    loop do
      puts "Choose empty cell"
      player_cell = gets.chomp.to_i - 1
      row = player_cell / 3
      col = player_cell % 3
      if @board[row][col].nil?
        @board[row][col] = @curr_player.mark
        break
      else
        puts "Wrong cell"
      end
    end
  end

  def finish_game
    print_board
    @winner ? puts("Congratulations, #{@winner.name}! You won!") : puts("DRAW")
    puts "Game finished"
  end
end
