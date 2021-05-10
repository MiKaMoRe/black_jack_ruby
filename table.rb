require_relative 'card'

class Table
  def initialize
    @bank = 0
    @deck = []
  end

  def create_deck
    for suit in 1..4 do
      case suit
      when 1
        suit = '♠'
      when 2
        suit = '♥'
      when 3
        suit = '♣'
      when 4
        suit = '♦'
      end
      for number in 1..13 do
        @deck << Card.new(suit, number)
      end
    end
  end

  def mix_deck
    raise 'Deck is empty! Create new deck' if deck_is_empty?
    clear_deck = @deck
    @deck = []
    while 1 <= clear_deck.length
      counting = clear_deck.length
      rnd = Random.new.rand(1..counting)
      card = clear_deck[rnd - 1]
      @deck << card
      clear_deck.delete(card)
    end
  end

  def get_card
    card = @deck[@deck.length - 1]
    @deck.pop
    card
  end

  def deal_cards(players)
    raise 'You need 2 or more players' if players.length < 2
    2.times{ players.each { |player| player.add_card(get_card) } }
  end

  def bets(players, bets)
    @bets = bets
    players.each { |player| @bank += player.bet_money(bets) }
  end

  def back_money(players)
    players.each do |player|
      player.get_money(@bets)
    end
    @bank = 0
    @bets = 0
  end

  def win_money(winner)
    winner.get_money(@bank)
    @bank = 0
  end

  protected

  def deck_is_empty?
    return @deck == []
  end

  # Debug method
  def cards_repeat?
    suit = false
    number = false
    @deck.each_with_index do |card_control, index_control|
      @deck.each_with_index do |card, index|
        next if index == index_control
        return card.suit == card_control.suit && card.number == card_control.number
      end
    end
  end
end