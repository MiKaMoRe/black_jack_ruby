class Card
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def weight
    case @number
    when 11..13
      10
    when 1
      1
    else
      @number
    end
  end

  def is_ace?
    return true if @number == 1
  end
end