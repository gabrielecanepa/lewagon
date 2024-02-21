require_relative "lib/lion"
require_relative "lib/meerkat"
require_relative "lib/warthog"

simba = Lion.new("Simba")
timon = Meerkat.new("Timon")
pumbaa = Warthog.new("Pumbaa")

[simba, timon, pumbaa].each do |animal|
  puts animal.talk
end

puts "Animal kingdoms phyla: #{Animal.phyla.join(", ")}"

puts timon.eat("scorpion")
puts pumbaa.eat("worm")
puts simba.eat("gazelle")
