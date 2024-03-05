class Building
  attr_reader :name
  attr_accessor :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end

  def build
    build_scaffolding
    build_walls
    build_roof
  end

  def to_s
    "#{@name} (#{self.class})"
  end

  private

  def build_scaffolding
    puts "Building scaffolding"
  end

  def build_walls
    puts "Building walls"
  end

  def build_roof
    puts "Building roof"
  end
end
