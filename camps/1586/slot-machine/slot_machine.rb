# TODO: let's code a SlotMachine class and play!
class SlotMachine
  # Declare constants (values that don't change) at the top of the class in UPPERCASE
  SYMBOLS = ["cherry", "seven", "bell", "star", "joker"]

  # Initialize the instance variables with an empty array of reels
  def initialize
    @reels = []
  end

  # Define the play method that fills the reels array with 3 random symbols
  def play
    @reels = []

    3.times do
      @reels << SYMBOLS.sample
    end

    @reels
  end

  # Define the score method that returns the score of the reels depending on some simple rules
  def score
    if three_identical?
      # If the reels have 3 identical symbols, return the base score of the first symbol (all 3 are equal!) multiplied by 10
      base_score(@reels[0]) * 10
    elsif two_identical_and_joker?
      # If the reels have 2 identical symbols and a joker, return the base score of the middle symbol multiplied by 5
      # Sorting the array makes sure that index 1 (middle element) is one of the pair
      base_score(@reels.sort[1]) * 5
    else
      0
    end
  end

  private

  def three_identical?
    # If the reels have 1 unique symbol, it means they are all the same
    @reels.uniq.size == 1
  end

  def two_identical_and_joker?
    @reels.uniq.size == 2 && @reels.include?("joker")
  end

  def base_score(symbol)
    # The base score can be calculated by finding the index of the symbol and adding 1
    # cherry = 0 + 1
    # seven = 1 + 1
    # ...
    SYMBOLS.index(symbol) + 1
  end
end
