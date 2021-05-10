class Card
  attr_reader :suit

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def weight_max
    case @number
    when 11..13
      10
    when 1
      11
    else
      @number
    end
  end

  def weight_min
    case @number
    when 11..13
      10
    when 1
      1
    else
      @number
    end
  end 

  def view
    case @number
    when 11
      'J'
    when 12
      'Q'
    when 13
      'K'
    when 1
      'T'
    else
      @number
    end
  end
end