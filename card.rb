class Card

  SCORE_INT_ARRAY = [1,2,3,4,5,6,7,8,9,10,10,10,10]
  CARD_NUMBER_STRING_ARRAY = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
  SUIT_STRING_ARRAY = ["Diamonds", "Hearts", "Clubs", "Spades"]

  def initialize(number, suit)
    @number = CARD_NUMBER_STRING_ARRAY[number]
    @score = SCORE_INT_ARRAY[number]
    @suit = SUIT_STRING_ARRAY[suit]
  end

  def get_value
    "the " + @number + " of " + @suit
  end

  def get_score
    @score
  end
end