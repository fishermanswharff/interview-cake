=begin
Write a function that, given:
  an amount of money
  an array of coin denominations
computes the number of ways to make amount of money with coins of the available denominations.

Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:

1¢, 1¢, 1¢, 1¢
1¢, 1¢, 2¢
1¢, 3¢
2¢, 2¢

=end

# We need to find some way to break this problem down into subproblems.
# here's one way: for each denomination, we can use it once, twice, or
# as many times as it takes to reach or overshoot the amount with coins
# of that denomination alone.
#
# For each of those choices of how many times to include coins of each
# denomination,we're left with the subproblem of seeing how many ways
# we can get the remaining amount from the remaining denominations
# def num_ways(amount, denominations)
#   for each denomination in denominations
#       for each num_times_to_use_denomination in possible_num_times_to_use_denomination_without_overshooting_amount
#           answer += num_ways(amount_remaining, other_denominations)
#       end
#   end
# end

# the answer for some of those subproblems will of course be 0. For example,
# there's no way to get 1¢ with only 2¢ coins.

# a simple recursive approach works, but you'll find that your function gets called more than once with the same inputs:
def change_possibilities_top_down(amount_left, denominations_left)
  # base cases:
  # we hit the amount spot on. yes!
  return 1 if amount_left == 0
  # we overshot the amount left (used too many coins)
  return 0 if amount_left < 0
  # we're out of denominations
  return 0 if denominations_left.length == 0
  # puts "checking ways to make #{amount_left} with #{denominations_left}"
  # choose a current coin
  current_coin, rest_of_coins = denominations_left[0], denominations_left[1..-1]
  # see how many possibilities we can get
  # for each number of times to use current_coin
  num_possibilities = 0
  while amount_left >= 0
      num_possibilities += change_possibilities_top_down(amount_left, rest_of_coins)
      amount_left -= current_coin
  end

  return num_possibilities
end

# We can avoid the duplicate function calls by memoizing, but there's a cleaner bottom-up approach
class Change
  def initialize
      @memo = {}
  end

  def change_possibilities_top_down(amount_left, denominations_left)
    # check our memo and short-circuit if we've already solved this one
    memo_key = [amount_left, denominations_left].to_s
    if @memo.include? memo_key
        # puts "grabbing memo[#{memo_key}]"
        return @memo[memo_key]
    end
    # base cases:
    # we hit the amount spot on. yes!
    return 1 if amount_left == 0
    # we overshot the amount left (used too many coins)
    return 0 if amount_left < 0
    # we're out of denominations
    return 0 if denominations_left.length == 0
    # puts "checking ways to make #{amount_left} with #{denominations_left}"
    # choose a current coin
    current_coin, rest_of_coins = denominations_left[0], denominations_left[1..-1]
    # see how many possibilities we can get for each number of times to use current_coin
    num_possibilities = 0
    while amount_left >= 0
        num_possibilities += change_possibilities_top_down(amount_left, rest_of_coins)
        amount_left -= current_coin
    end
    # save the answer in our memo so we don't compute it again
    @memo[memo_key] = num_possibilities
    return num_possibilities
  end
end

# This answer is quite good. It certainly solves our duplicate work problem. It takes
# O(n*m) time and o(n*m) space, where n is the size of amount and m is the number of
# items in denominations
#
# Because our function is recursive it will build a large call stack, of size O(m).
# Of course, this cost is eclipsed by the memory cost of @memo, which is O(n*m).
# But it's still best to avoid building up a large stack like this, because it can
# cause a stack overflow.
#
# A great way to avoid recursion is to go bottom-up
#
# Our recursive approach was top-down because it started with the final value
# for amount and recursively broke the problem down into subproblems with smaller values
# for amount. What if instead we tried to compute the answer for small values of amount
# first, and use those answers to iteratively compute the answer for higher values
# until arrival at the final amount?
#
# We can start by making an array ways_of_doing_n_cents, where the index is the
# amount and the value at each index is the number of ways of getting to that amount.
#
# This array will take 0(n) space where n is the size amount.
#
# To further simplify the problem we can work with only the first coin in denominations
# then add in the second coin, the third, etc.
#
# what would ways_of_doing_n_cents look like for just our first coin: 1¢?
#
ways_of_doing_n_cents_1 = [
  1, # 0c: no coins
  1, # 1c: 1 1c coin
  1, # 2c: 2 1c coins
  1, # 3c: 3 1c coins
  1, # 4c: 4 1c coins
  1, # 5c: 5 1c coins
]

# now what if we add a 2¢ coin?

ways_of_doing_n_cents_1_2 = [
  1,    # 0c: no change
  1,    # 1c: 1 no change
  1+1,  # 2c: new [(2)]
  1+1,  # 3c: new [(2,1)]
  1+2,  # 4c: new [(2,1,1),(2,2)]
  1+2,  # 5c: new [(2,1,1,1),(2,2,1)]
]

# how do we formalize the process of going from ways_of_doing_n_cents_1 to
# ways_of_doing_n_cents_1_2?
#
# Lets suppose we're partway through already (this is a classic dynamic programming approach).
# Say we're trying to calculate ways_of_doing_n_cents_1_2[5].
# Because we're going bottom-up, we know we already have:
#
# 1. ways_of_doing_n_cents_1_2 for amounts less than 5
# 2. a fully-populated ways_of_doing_n_cents_1
#
# So how many new ways should we add to ways_of_doing_n_cents_1[5] to get ways_of_doing_n_cents_1_2[5]?
# Well if there are any new ways to get 5¢ now that we have 2¢ coins those new ways must involve at least
# one 2¢ coin. So if we presuppose that we'll use one 2¢ coin, that leaves us with 5-2=3 left to come up with.
# We already know how many ways we can get 3¢ with 1¢ and 2¢ coins: ways_of_doing_n_cents_1_2[3], which is 2.
# So we can see that:
ways_of_doing_n_cents_1_2[5] = ways_of_doing_n_cents_1[5] + ways_of_doing_n_cents_1_2[5-2]

# Why don't we also need to check ways_of_doing_n_cents_1_2[5-2-2] (2 2¢ coins)??
# because we already checked ways_of_doing_n_cents_1_2[1] when calulating ways_of_doing_n_cents_1_2[3].
# We'd be counting some arrangements multiple times. In other words, ways_of_doing_n_cents_1_2[k] already
# includes possibilities that use 2¢ any number of times. We're only interested in how many MORE possibilities
# we might get when we go from k to k+2 and thus have the ability to add one more 2¢ coin to each of
# the possibilities we have for k.
#

def change_possibilities_bottom_up(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 1)
  ways_of_doing_n_cents[0] = 1

  denominations.each do |coin|
    (coin..amount).each do |higher_amount|
      higher_amount_remainder = higher_amount - coin
      ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
    end
  end

  ways_of_doing_n_cents[amount]
end

# Here's how ways_of_doing_n_cents would look in successive iterations of our function for amount=5 and denominations=[1,3,5].

=begin
  ===========
key:
a = higher_amount
r = higher_amount_remainder
===========

============
for coin = 1:
============
[1, 1, 0, 0, 0, 0]
 r  a

[1, 1, 1, 0, 0, 0]
    r  a

[1, 1, 1, 1, 0, 0]
       r  a

[1, 1, 1, 1, 1, 0]
          r  a

[1, 1, 1, 1, 1, 1]
             r  a

============
for coin = 3:
=============
[1, 1, 1, 2, 1, 1]
 r        a

[1, 1, 1, 2, 2, 1]
    r        a

[1, 1, 1, 2, 2, 2]
       r        a

============
for coin = 5:
=============
[1, 1, 1, 2, 2, 3]
 r              a


final answer: 3


=end




























