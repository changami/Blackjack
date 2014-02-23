require_relative 'card'

class CardDeck
  SUIT = 4
  TYPE_OF_CARD_NUMBER = 13

  def initialize
    @card_deck = Array.new
    SUIT.times do |suit|
      TYPE_OF_CARD_NUMBER.times do |number|
        @card_deck << Card.new(number, suit)
      end
    end
  end

  def pick_out_card_at_random
    draw_id = rand(@card_deck.size)
    card = @card_deck[draw_id]
    @card_deck.delete_at(draw_id)
    card
  end

  def size
    @card_deck.size
  end

  def clear
    @card_deck.clear
  end
end