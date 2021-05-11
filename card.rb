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
      'J' << @suit
    when 12
      'Q' << @suit
    when 13
      'K' << @suit
    when 1
      'T' << @suit
    else
      @number.to_s << @suit
    end
  end
end