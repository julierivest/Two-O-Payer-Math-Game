require'./question'
require './player'


class Game
  #attr_accessor

  def initialize
    @p1 = Player.new("Player 1", true)
    @p2 = Player.new("Player 2")

  end

  def turn

    while @p1.lives > 0 && @p2.lives > 0
      question = Question.new
      @q = question.generate_q

      if @p1.turn
        puts @p1.name + ": " + @q
      else
        puts @p2.name + ": " + @q
      end

      player_answer = gets.chomp

      if question.validate_answer(player_answer)
        if @p1.turn
          puts "CORRECT!"
          @p1.turn = false
          @p2.turn = true
        else
          puts "CORRECT!"
          @p1.turn = true
          @p2.turn = false
        end
      else
        if @p1.turn
          puts "INCORRECT!"
          @p1.lives = @p1.lives - 1
          @p1.turn = false
          @p2.turn = true
          win?
        else
          puts "INCORRECT!"
          @p2.lives = @p2.lives - 1
          @p1.turn = true
          @p2.turn = false
          win?
        end
      end
    end #while

  end #turn

  def win?
    if @p1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@p2.name} wins!"
    elsif @p2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@p1.name} wins!"
    else
      puts @p1.name + ": " + @p1.lives.to_s + "/3 vs " + @p2.name + ": " + @p2.lives.to_s + "/3"
      puts "----- NEW TURN -----"
    end
  end
end



