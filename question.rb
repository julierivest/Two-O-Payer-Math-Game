require './player'
require 'active_support/all'
require './game'


class Question
  attr_accessor :question #, :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def generate_q
    question = "What does #{@num1} plus #{@num2} equal?"
    return question
  end

  # def calc_answer
  #   answer = @num1 + @num2
  #   return answer
  # end

  def validate_answer(input)
    if input.to_i == (@num1 + @num2)
      return true
    else
      return false
    end
  end
end
