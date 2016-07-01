require 'byebug'
=begin
Given an array_of_ints, find the highest_product you can get from three of the integers.
The input array_of_ints will always have at least three integers.

we can use the greedy approach here again.
the best answer so far will be the highest product from 3 integers
=end

def highest_product_from_three_ints(array)
  if array.length < 3
    raise StandardError.new('Array must be longer than 3 integers')
  end
  # start by assigning the lowest int to the min between the first two ints in the array
  lowest = [array[0], array[1]].min
  # start by assigning the highest to the max of the first 2 ints in the array
  highest = [array[0], array[1]].max
  # we'll start to keep the high/low product of 2
  lowest_product_of_2 = array[0] * array[1]
  highest_product_of_2 = array[0] * array[1]
  # start with the default value of the highest_product_of_3
  highest_product_of_3 = array[0] * array[1] * array[2]
  # since we defaulted using the first 2 values in the array (indices 0 & 1)
  # we start iterating through the array at index 2
  for i in 2..array.length - 1
    highest_product_of_3 = [highest_product_of_3, array[i] * highest_product_of_2, array[i] * lowest_product_of_2].max
    highest_product_of_2 = [highest_product_of_2, array[i] * highest, array[i] * lowest].max
    lowest_product_of_2 = [lowest_product_of_2, array[i] * highest, array[i] * lowest].min
    highest = [highest, array[i]].max
    lowest = [lowest, array[i]].min
  end
  highest_product_of_3
end

# ok solution, doesn't account for negative numbers
# array = array.sort
# array[-1] * array[-2] * array[-3]

# Given [2,3,4,5]
# greedy approach is a great way to get to O(n) runtime
# how can we keep track of the highest_product_of_three 'so far' as we walk through the array once?
# for each new current number during our iteration, how do we know if it gives us a new highest_product_of_three?
# we have a new highest_product_of_three if the current number times 2 other numbers gives a product that's
# higher than our current highest_product_of_three.
# What must we keep track of at each step so that we know if the current number times 2 other numbers
# gives us a new highest_product_of_three?

# we need to keep track of the product of the two numbers that we multiply against the 3rd
# the lowest,
# the highest
# current_highest_product_of_two = 0
# current_lowest_product_of_two = 0
# current_highest_product_of_three = 0
# i == 0
# => 2*1 > current_highest_product_of_two ? current_highest_product_of_two = 2*1 : current_highest_product_of_two
# => 2*1 < current_lowest_product_of_two ? current_lowest_product_of_two = 2*1 : current_lowest_product_of_two
#
# current_highest_product_of_two = 2
# current_lowest_product_of_two = 2
# current_highest_product_of_three = 0
# i == 1
# => multiply array[i] * array[i-1]
# => 3*2
# => 6 > current_highest_product_of_two ? current_highest_product_of_two = array[i] * array[i-1] : current_highest_product_of_two
# => 6 < current_lowest_product_of_two ? current_lowest_product_of_two = array[i] * array[i-1] : current_lowest_product_of_two
#
# current_highest_product_of_two = 6
# current_lowest_product_of_two = 2
# current_highest_product_of_three = 24
# i == 2
# => multiply array[i] * array[i-1]
# => 4 * 3
# => 12 > current_highest_product_of_two ? current_highest_product_of_two = array[i] * array[i-1] : current_highest_product_of_two
# => 12 < current_lowest_product_of_two ? current_lowest_product_of_two = array[i] * array[i-1] : current_lowest_product_of_two


# current_highest_product_of_two = 6
# current_lowest_product_of_two = 2
# current_highest_product_of_three = 0
# i == 2
# => multiply array[i] * array[i-1]


