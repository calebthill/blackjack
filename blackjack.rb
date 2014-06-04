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
  attr_accessor :hand, :players_hand
  def initialize
    @deck = Deck.new
  end


  def players_initial_hand
    card1 = @deck.deal
    card2 = @deck.deal
    @players_hand = []
    @players_hand << card1
    @players_hand << card2
    puts "Player was dealt #{card1.show_card[0]}#{card1.show_card[1]}"
    puts "Player was dealt #{card2.show_card[0]}#{card2.show_card[1]}"

  end

  def hit
    card = @deck.deal
    @players_hand << card
    puts "Player was dealt #{card.show_card[0]}#{card.show_card[1]}"
    card
  end

  def score_hand_p
    score = 0

    @players_hand.each do |card|
      score += card.value?
    end
    # if @players_hand
     score
    # end

  end

  def score_hand_d
    score = 0
    @dealers_hand.each do |card|
      score += card.value?
    end
    score
  end

#MUST KEEP HITTING UNTIL 17
  def dealers_hand
    @dealers_hand = []
    @dealers_hand << @deck.deal
    @dealers_hand << @deck.deal
    while score_hand_d < 17
      @dealers_hand << @deck.deal
    end
  end

  def compare_score
    if score_hand_d == 21
      puts "Dealer has #{score_hand_d}"
      puts "Dealer wins!"
    elsif score_hand_d > 21
      #dealer ace method goes here
      puts "Dealer has #{score_hand_d}"
      puts "Dealer busts.  You win!"
    elsif score_hand_p > score_hand_d
      puts "You win!"
    else
      puts "Dealer wins! #{score_hand_d}"
    end
  end

  def show_players_hand
    @players_hand
  end

  def show_players_score
    @score.to_a
  end


  def player_ace_value
    @score = score_hand_p
    b = @players_hand

    counter = 0
    a = []
    b.each do |card|
      a << card.show_card
    end
    a.each do |card|
      if card[0] == "A"
        counter += 1
      end
    end

    while counter >= 1 && @score > 21
      @score = @score - 10
      counter -= 1
    end
    @score
  end
end




hand = Hand.new

puts "Welcome to Blackjack!"
puts
hand.players_initial_hand



while true
  if hand.player_ace_value < 21
    puts "Player score: #{hand.player_ace_value}"
    print "Hit or stand (h/s):"
    user_input = gets.chomp
    if user_input == "h"
        hand.hit

        # puts "Player score: #{hand.show_players_score}"
    else
        puts "Player score: #{hand.player_ace_value}"
        hand.dealers_hand
        hand.compare_score
        break
    end
  elsif hand.player_ace_value == 21
    puts "Player score: #{hand.player_ace_value}"
    puts "Blackjack! You win!"
    break
  elsif hand.player_ace_value > 21
    puts "Player score: #{hand.player_ace_value}"
    puts "Bust! You lose."
    break
  end
end


