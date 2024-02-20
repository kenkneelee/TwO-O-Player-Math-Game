class Player
  attr_reader :lives

  def initialize
    @lives = 3
  end

  def die
    @lives -= 1
  end

  def alive?
    @lives > 0
  end

  def score
    "#{@lives}/3"
  end
end