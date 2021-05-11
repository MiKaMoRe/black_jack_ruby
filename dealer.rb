require_relative 'character'

class Dealer < Character
  # Суть заключается в том, что метод возращает true, 
  # если значение choice будет 1, 2 или 3.
  # В зависимости от того, сколько очков у диллера,
  # шанс того, что он выберет "взять карту" изменяется.
  def take_card
    rnd = Random.new
    case score
    when 1..10
      choice = 1
    when 19..20
      choice = rnd.rand(1..15)
    when 16..18
      choice = rnd.rand(1..10)
    when 13..15
      choice = rnd.rand(1..6)
    when 11..12
      choice = rnd.rand(1..4)
    else
      choice = 4
    end
    return 'take' if choice.between?(1,3)
    'pass'
  end
end