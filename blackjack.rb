require 'pry'

RANK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUIT = ['♠', '♥', '♣', '♦']


class Card
  attr_reader :card
#represent an individual playing card. This class should
#contain the suit and the value and provide methods for
#determining what type of card it is (e.g. face card or ace).
  def initialize(rank, suit)
    @card = [rank, suit]
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

  def show_card
    @card
  end
end




class Deck
#creates a deck of shuffled cards
  def initialize
    @deck = []
    RANK.each do |rank|
      SUIT.each do |suit|
        card = Card.new(rank, suit)
        @deck << card
      end
    end
    #@deck = @deck.shuffle
    @deck.shuffle!
  end

  def deal
    card = @deck.pop
  end

  def count
    @deck.count
  end
end




class Hand
  attr_accessor :hand
  def initialize
    @deck = Deck.new
  end


  def players_initial_hand
    #we will refactor!!!!!!
    @players_hand = []
    @players_hand << @deck.deal
    @players_hand << @deck.deal
    card1 = @players_hand[0]
    card2 = @players_hand[1]
    firstcard1 = card1.show_card
    firstcard2 = card2.show_card
    puts "player was delt: #{firstcard1[0]}#{firstcard1[1]}"
    puts "player was delt: #{firstcard2[0]}#{firstcard2[1]}"
    @score = card1.value? + card2.value?
    puts "Players score: #{@score}"
  end

  def hit
    @players_hand << @deck.deal
    @players_hand
    @players_hand.each do |card|
      @score += card.show_card[0].to_i
    end
    @score
    @players_hand
  end

  def hit_result
    @current_card = @players_hand[-1].show_card
    puts "Player was dealt: #{@current_card[0]}#{@current_card[1]}"
    puts "player score: #{@score}"
  end



  def dealers_hand
    dealers_hand = []
    dealers_hand << @deck.deal
    dealers_hand << @deck.deal
  end
#represent the player's and dealer's hand. This class will need to
#determine the best score based on the cards that have been dealt.
  def show_players_hand
    @players_hand
  end

end

hand = Hand.new
hand.players_initial_hand
hand.hit_result





