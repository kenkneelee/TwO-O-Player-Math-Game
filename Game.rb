class MathGame
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  def start
    while !game_over?
      new_turn
    end
    announce_winner
  end

  private

  def new_turn
    question = Question.new
    current_player_name = @current_player == @player1 ? "Player 1" : "Player 2"
    question.ask_question(current_player_name)
    answer = gets.chomp
    if question.correct?(answer)
      puts "#{current_player_name}: YES! You are correct."
    else
      puts "#{current_player_name}: Seriously? No!"
      @current_player.die
    end
    switch_player
    display_scores
    puts "----- NEW TURN -----"
  end

  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  def announce_winner
    winner = @player1.alive? ? "Player 1" : "Player 2"
    loser = winner == "Player 1" ? "Player 2" : "Player 1"
    puts "#{winner} wins with a score of #{@player1.score}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def display_scores
    puts "Player 1: #{@player1.score} vs Player 2: #{@player2.score}"
  end
end
