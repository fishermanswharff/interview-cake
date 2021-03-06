require 'byebug'
# It is not sufficient to simply take the difference between the highest price and the lowest price, because the highest price may come before the lowest price. You must buy before you sell.

# stock_prices_yesterday = [490,489,487,488,475,489,450,490,491,492,493,494,497,500,467,490,504,506,508,497,499,520,534,576,587,599,620,602,604,603,587,596,595,593,591,540]

# hash = {
#   low: 0,
#   high: 0
# }

# stock_prices_yesterday.each_with_index { |item,i|
#   hash[:low] = item if i == 0
#   hash[:high] = item if i == 0
#   hash[:low] = item if item < hash[:low]
#   hash[:high] = item if item > hash[:high]
# }

# hash[:high] - hash[:low]

def get_best_profit(stock_prices_yesterday)
  raise IndexError, 'Getting a profit requires at least 2 prices' if stock_prices_yesterday.length < 2
  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]
  stock_prices_yesterday.each_with_index do |current_price, index|
    next if index == 0
    max_profit = [max_profit, current_price - min_price].max
    min_price = [min_price, current_price].min
  end
  max_profit
end

=begin

Greedy approach is often a great way to break down a new question.

"Suppose we could come up with the answer in one pass through the input by simply updating the best answer so far as we went."
What additional values would we need to keep as we looked at each item in our set in order to be able to produce the best answer so far in constant time?

In this case:
  The best answer so far is the max profit, based on the prices we've seen so far.
  The additional value is the minimum price we've seen so far.

=end
