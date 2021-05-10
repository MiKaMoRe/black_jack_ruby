require_relative 'player'
require_relative 'dealer'
require_relative 'table'

class Game
  def initialize(table, *players)
    @table = table
    @players = players
    @move = 0
  end

  def start_game
    @table.create_deck
    @table.mix_deck
    @table.deal_cards(@players)
    @table.bets(@players)
  end

  def move(choice)
    case choice
    when 'take'
      take_card
    when 'pass'
      pass_move
    when 'show'
      end_game
    else
      false
    end
  end

  def winner_define
    return nil if draw_game?
    score_players.each_with_index.max[1]
  end

  def end_game
    winner_index = winner_define
    if winner_index.nil?
      draw_game
    else
      winner = @players[winner_index]
      @table.win_money(winner)
    end
  end

  private

  def draw_game
    @table.back_money(@players)
  end

  def draw_game?
    score = @players[0].score
    score_players.each { |player| return false if score != player.score }
    true
  end

  def score_players
    @players.map { |player| player.score }
  end

  def pass_move
    if @move <= @players.length - 1
      @move += 1
    else
      @move = 0
    end
  end

  def take_card
    @players[@move].add_card(@table.get_card)
    pass_move
  end
end