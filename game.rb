require_relative 'player'
require_relative 'dealer'
require_relative 'table'

class Game
  def initialize(table, players*)
    @table = table
    @players = players
  end

  def start_game
    @table.create_deck
    @table.mix_deck
    @table.deal_cards(@players)
    @table.bets(@players)
  end


end