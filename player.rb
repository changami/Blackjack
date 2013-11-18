require './card.rb'
require './card_deck.rb'

class Player
  NUMBER_OF_HAND_AT_THE_START = 2
  def initialize(icon, name, deck)
    @icon = icon
    @name = name
    @hand = Array.new
  end

  def get_name
    @name
  end

  def drow
    @hand << @deck.pick_out_card_at_random
  end

  def prepare(deck)
    @deck = deck
    @hand.clear

    NUMBER_OF_HAND_AT_THE_START.times do
      self.drow
    end
  end

  def calc_score
    score = 0
    @hand.each do |card|
      score += card.get_score
    end
    return score
  end

  def get_hand_value
    hand_value = String.new

    @hand.each do |card|
      unless hand_value == "" then
        hand_value += ", "
      end
      hand_value += card.get_value
    end

    return hand_value
  end

  def to_string_for_display
    status = @icon
    status += @name
    status += " [#{self.calc_score()}] "
    status += self.get_hand_value()
    status += " <#{@hand.size}>"
    return status
  end
end