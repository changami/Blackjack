require './card.rb'
require './card_deck.rb'
require './player.rb'

class Computer < Player
  def to_string_for_display_in_the_game
    status = @icon
    status += @name
    status += " [?] "
    status += @hand[0].get_value
    status += " ************"
    return status
  end

  def draw_card_until_17_points
    while self.calc_score() <= 17 do
      self.drow()
    end
  end
end