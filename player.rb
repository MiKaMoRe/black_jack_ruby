require_relative 'character'

class Player < Character
  attr_reader :name

  def initialize(money, name)
    super(money)
    @name = name
  end
end