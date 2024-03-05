# Slot Machine

Let’s implement a `SlotMachine` class with 3 reels. Each reel has 5 different items.

The class has one public instance method, `score`, following these rules:

| Item	        | Three of the same	  | Two of the same + Joker   |
|---------------|---------------------|---------------------------|
| Joker 🤩      | 50	                | 25 (2 jokers + anything)  |
| Star ⭐️       |	40	                | 20                        |
| Bell 🛎       |	30	                | 15                        |
| Seven 7️⃣      | 20	                 | 10                        |
| Cherry 🍒     |	10	                | 5                         |

Once `#score` is implemented and tested, we can add a second public method `#play` to shuffle the reels.

You can read more about slot machines and how they work [here](https://theguardian.com/australia-news/datablog/ng-interactive/2017/sep/28/hooked-how-pokies-are-designed-to-be-addictive).

## Usage

Download this folder to your computer with:

```sh
sh -c "$(curl -s https://raw.githubusercontent.com/gabrielecanepa/lewagon/main/download.sh)" -- camps/1586/livecodes/slot-machine
cd slot-machine
```

Launch an IRB session and require the `slot_machine.rb` file:

```ruby
require_relative 'slot_machine'

slot_machine = SlotMachine.new
slot_machine.play # => [🍒, ⭐️, 🛎]
slot_machine.score # => 0
slot_machine.play # => [🤩, 🤩, 🍒]
slot_machine.score # => 25
slot_machine.play # => [🍒, 🍒, 🍒]
slot_machine.score # => 10
# etc.
```
