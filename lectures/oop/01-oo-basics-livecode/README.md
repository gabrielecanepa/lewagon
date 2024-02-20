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
