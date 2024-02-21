require_relative "animal"

class Lion < Animal
  def talk
    "#{name} roar"
  end

  def eat(animal)
    "#{super(animal)}. Law of the Jungle!"
  end
end
