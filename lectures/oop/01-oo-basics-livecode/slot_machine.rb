# Simplified SlotMachine with 3 identical or 2+joker rules.
class SlotMachine
  SYMBOLS = %w[cherry seven bell star joker].freeze

  def initialize
    @reels = []
  end

  def play
    @reels = []
    3.times { @reels << SYMBOLS.sample }
    @reels
  end

  def score
    if three_identical?
      base_score(@reels[0]) * 10
    elsif two_identical_and_joker?
      # Sorting the array makes sure that index 1 (middle element) is one of the pair
      base_score(@reels.sort[1]) * 5
    else
      0
    end
  end

  private

  def three_identical?
    @reels.uniq.size == 1
  end

  def two_identical_and_joker?
    @reels.uniq.size == 2 && @reels.include?("joker")
  end

  def base_score(symbol)
    SYMBOLS.index(symbol) + 1
  end
end
