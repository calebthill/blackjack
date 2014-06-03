require 'pry'

RANK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUIT = ['♠', '♥', '♣', '♦']


class Card
#represent an individual playing card. This class should
#contain the suit and the value and provide methods for
#determining what type of card it is (e.g. face card or ace).
  def initialize(rank, suit)
    @card = "#{rank}#{suit}"
  end


  def face_card?
    if @card[0] == "J" || @card[0] == "Q" || @card[0] == "K"
      true
    else
      false
    end
  end

  def ace?
    if @card[0] == "A"
      true
    else
      false
    end
  end

  def value?
    #calculate values of indiviual cards
    if @card[0] == "J" || @card[0] == "Q" || @card[0] == "K"
      10
    elsif @card[0] == "A"
      11
    else
      @card[0].to_i
    end
  end
end




class Deck
#creates a deck of shuffled cards
  def initialize
    deck = []
    RANK.each do |rank|
      SUIT.each do |suit|
        card = Card.new(rank, suit)
        deck << card
      end
    end
    @deck = deck.shuffle!
    binding.pry
  end
end








class Hand
  def initialize
  end

  def players_hand
  end

  def dealers_hand
  end
#represent the player's and dealer's hand. This class will need to
#determine the best score based on the cards that have been dealt.
end


deck1 = Deck.new

puts "hit or stand? h/s____"
players_input = gets.chomp
if players_input == "h"
  card = deck1.pop
end

if players_input == "s"
  #total cards>>>>
end














