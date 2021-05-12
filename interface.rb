
class Interface
  def initialize
    main
  end

  def main
    start
    loop do
      @game.start
      loop do
        system("clear")
        show_bank
        show_wallets
        show_cards
        player = @game.whoes_move
        if player.class == Dealer
          @game.select(player.take_card)
        else
          break if !@game.select(select_action)
        end
      end
      system("clear")
      show_bank
      show_wallets
      open_cards
      puts 'Конец'
      puts 'Хотите сыграть еще? yes/no'
      break if gets.chomp == 'no'
    end
  end

  private

  def start
    name = enter_your_name
    player = Player.new(100, name)
    table = Table.new
    dealer = Dealer.new(100)
    @game = Game.new(table, player, dealer)
  end

  def show_bank
    puts "Банк: #{@game.table.bank}"
  end

  def show_wallets
    @game.players.each do |player| 
      if player.class == Dealer
        puts "Кошелёк диллера #{player.wallet}"
      else
        puts "Кошелёк #{player.name}: #{player.wallet}"
      end
    end
  end

  def show_cards
    @game.players.each do |player|
      cards = ''
      if player.class == Dealer
        player.hand.cards.each { cards << '* ' }
        puts "Карты диллера: #{cards}"
      else
        player.hand.cards.each { |card| cards << card_view(card) << ' '}
        puts "Карты #{player.name}: #{cards}"
      end
    end
  end

  def open_cards
    @game.players.each do |player|
      cards = ''
      if player.class == Dealer
        player.hand.cards.each { |card| cards << card_view(card) << ' ' }
        puts "Карты диллера: #{cards} - score: #{player.hand.score}"
      else
        player.hand.cards.each { |card| cards << card_view(card) << ' '}
        puts "Карты #{player.name}: #{cards} - score: #{player.hand.score}"
      end
    end
  end

  def select_action
    puts 'Выберите действие: take, pass, show'
    gets.chomp
  end

  def enter_your_name
    puts 'Введите имя'
    gets.chomp
  end

  def card_view(card)
    case card.number
    when 11
      'J' << card.suit
    when 12
      'Q' << card.suit
    when 13
      'K' << card.suit
    when 1
      'T' << card.suit
    else
      card.number.to_s << card.suit
    end
  end
end