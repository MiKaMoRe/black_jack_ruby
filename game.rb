require_relative 'player'
require_relative 'dealer'
require_relative 'table'
require_relative 'interface'

class Game
  attr_reader :players, :table

  def initialize(table, *players)
    @table = table
    @players = players
    @move = 0
  end

  def start
    @players.each { |player| player.hand.clear_deck }
    @table.clear_deck
    @table.create_deck
    @table.mix_deck
    @table.deal_cards(@players)
    @table.bets(@players, 10)
  end

  def select(choice)
    case choice
    when 'take'
      take_card
    when 'pass'
      pass_move
    when 'show'
      stop
      false
    else
      true
    end
  end

  def stop
    winner_index = winner_define
    if winner_index.nil?
      draw_game
    else
      winner = @players[winner_index]
      @table.win_money(winner)
    end
  end

  def whoes_move
    @players[@move]
  end

  private

  def winner_define
    return nil if draw_game?

    past_player = @players[0]
    winner_index = 0
    @players.each_with_index do |player, index| 
      if !player.out_of_range? && !past_player.out_of_range? && past_player.hand.score <= player.hand.score
        winner_index = index
      end
      if past_player.out_of_range? && !player.out_of_range?
        winner_index = index
      end
      score = player.hand.score
    end
    winner_index
  end

  def draw_game
    @table.back_money(@players)
  end

  def draw_game?
    score = @players[0].hand.score
    counter = @players.select { |player| player.out_of_range? }.length

    return true if counter == @players.length

    counter = -1
    @players.each do |player|
      if score == player.hand.score
        counter += 1
      end
    end

    return true if counter == @players.length

    false
  end

  

  def pass_move
    if @move < @players.length - 1
      @move += 1
    else
      @move = 0
    end
  end

  def take_card
    @players[@move].hand.add_card(@table.get_card)
    pass_move
  end
end

Interface.new()