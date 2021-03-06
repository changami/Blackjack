require_relative 'card'
require_relative 'card_deck'
require_relative 'player'
require_relative 'computer'

class Blackjack
  MINIMUM_DECK_SIZE = 17
  BLACKJACK = 21
  MESSAGE_TITLE = '■■■■■■■■ BLACKJACK ■■■■■■■■'
  MESSAGE_CONTINUE = 'Do you want to continue the game? [Enter/n]'
  MESSAGE_DRAW = 'Do you want to draw a card? [Enter/n]'
  MESSAGE_END = 'Thank you for playing!!', 'presented by chan_gami'
  COMPUTER_ICON = '■'
  PLAYER_ICON = '□'
  ANIMATION_ICON = '■'

  def initialize(computer_name, player_name)
    @deck = CardDeck.new
    @computer = Computer.new(COMPUTER_ICON, computer_name)
    @player = Player.new(PLAYER_ICON, player_name)
  end

  def deck_reset
    if @deck.size < MINIMUM_DECK_SIZE
      @deck.clear
      @deck = CardDeck.new
    end
  end

  def prepare
    self.deck_reset
    @player.prepare(@deck)
    @computer.prepare(@deck)
  end

  def show_the_game
    puts @computer.to_string_for_display_in_the_game, @player.to_string_for_display
  end

  def show_the_game_result
    puts '', @computer.to_string_for_display, @player.to_string_for_display
  end

  def animation(times, delay_span, display)
    times.times do
      print display
      sleep delay_span
    end
    puts
  end

  def hit_or_stand
    while @player.calc_score < BLACKJACK do
      puts '', MESSAGE_DRAW
      print '> '
      answer = STDIN.gets.chomp
      unless answer == ''
        break
      end
      puts
      @player.draw
      self.show_the_game
    end
  end

  def judge
    if @computer.calc_score > BLACKJACK && @player.calc_score > BLACKJACK || @computer.calc_score == @player.calc_score
      puts '', 'DRAW GAME..'
    elsif @player.calc_score <= BLACKJACK && (@computer.calc_score > BLACKJACK || @computer.calc_score < @player.calc_score) then
      puts '', 'YOU WIN!!'
    else
      puts '', 'YOU LOSE..'
    end
  end

  def continue?
    puts '', MESSAGE_CONTINUE
    print '> '
    if STDIN.gets.chomp == ''
      true
    else
      false
    end
  end

  def play
    puts MESSAGE_TITLE, ''
    begin
      self.prepare
      self.show_the_game
      self.hit_or_stand
      @computer.draw_card_until_17_points
      self.animation(50, 0.01, ANIMATION_ICON)
      self.show_the_game_result
      self.judge
    end while self.continue?
    MESSAGE_END.each do |message|
      puts message
    end
  end
end