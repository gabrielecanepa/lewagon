require_relative "building"

class Castle < Building
  attr_accessor :moat

  def has_a_moat?
    !@moat.nil?
  end

  def floor_area
    super + 10000
  end

  def self.categories
    ["Medieval", "Ancient", "Norman"]
  end
end
