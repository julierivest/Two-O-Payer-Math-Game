require './game'
require './question'


class Player
  attr_accessor :name, :lives, :turn

  def initialize(name, turn = false)
    @name = name
    @lives = 3
    @turn = turn
  end



end