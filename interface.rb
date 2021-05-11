
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
        show_decks
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
      open_decks
      puts 'Конец'
      puts 'Хотите сыграть еще? yes/no'
      break if gets.chomp == 'no'
    end
  end

  def start
    name = enter_your_name
    player = Player.new(100, name)
    table = Table.new
    dealer = Dealer.new(100)
    @game = Game.new(table, player, dealer)
  end

  private

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

  def show_decks
    @game.players.each do |player|
      cards = ''
      if player.class == Dealer
        player.hand.deck.each { cards << '* ' }
        puts "Карты диллера: #{cards}"
      else
        player.hand.deck.each { |card| cards << card.view << ' '}
        puts "Карты #{player.name}: #{cards}"
      end
    end
  end

  def open_decks
    @game.players.each do |player|
      cards = ''
      if player.class == Dealer
        player.hand.deck.each { |card| cards << card.view << ' ' }
        puts "Карты диллера: #{cards} - score: #{player.hand.score}"
      else
        player.hand.deck.each { |card| cards << card.view << ' '}
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
end