require_relative 'character'

class Player < Character
  def initialize(money, name)
    super(money)
    @name = name
  end
end