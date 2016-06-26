require 'pry'
# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.

# [1,2,6,5,9]
def get_products_of_all_ints_except_at_index(array)
  products_of_ints_except_at_index = [1] * array.length # => [1,1,1,1,1]

  # iterate through forwards, storing the products of all ints BEFORE the index
  product = 1
  i = 0
  while i < array.length
    products_of_ints_except_at_index[i] = product
    # [1,1,1,1,1]
    # [1,1,1,1,1]
    # [1,1,2,1,1]
    # [1,1,2,12,1]
    # [1,1,2,12,60]
    product *= array[i]
    # 1,2,12,60,540
    i += 1
  end

  # iterate through backwards, storing the products of all ints AFTER the index
  product = 1
  i = array.length - 1
  while i >= 0
    products_of_ints_except_at_index[i] *= product
    # [1,1,2,12,60]
    # [1,1,2,108,60]
    # [1,1,90,108,60]
    # [1,270,90,108,60]
    # [540,270,90,108,60]
    product *= array[i]
    # 9,45,270,540,540
    i -= 1
  end
  products_of_ints_except_at_index
end

# a brute force approach would use two loops to multiply the integer at every index by the integer at every nested_index, unless index == nested_index
# we're wasting a lot of time doing the same calculations.
# O(n2) time, not very good

# result = []
# array.map.with_index { |p,i| result << array.select { |num| num if num != array[i] }.reduce(:*) }
# return result

# [2*6*5*9, 1*6*5*9, 1*2*5*9, 1*2*6*9, 1*2*6*5]

# look at this pattern:
# [ 1, 1*2, 1*2*6, 1*2*6*5 ]

# we could be storing the results. this would be a great time to use the greedy approach
# we could store the results of each multiplication highlighted blue, then just multiply by one new integer each time.
# so in the last highlighted multiplication, for example, we wouldn't have to multiply 1*2*6 again. If we stored that value (12) from the previous multiplication we could just multiply 12*5

# what do [ 1, 1*2, 1*2*6, 1*2*6*5 ] all have in common?
# they are all the integers before each index in the input array

#   [1,2,6,5,9]
#    0 1 2 3 4

# for example, the multiplication at index 3 (1*2*6) is all the integers before index 3 in the input array

# Do all the multiplications that aren't highlighted have anything in common?
# [2*6*5*9, 2*5*9, 5*9, 9]

# They're all the integers that are after each index


# The product of all the integers except the integer at each index can be broken down into:

#   1. the product of all the integers before each index
#   2. the product of all the integers after each index

# To start, let's get the product of all the integers before each index

# [ 1, 2, 12, 60 ]

# notice that we're always adding one new integer to our multiplication for each index
# So to get the products of all the integers before each index, we could greedily store each product
# so far and multiply that by the next integer…then we can store that new product so far and keep going

# to make an array products_of_ints_before_index:

# make an array with the length of the input array to hold our
# products so far, starting with all the values set to 1

# Right now, we'll need three arrays:
# 1. products_of_ints_before_index
# 2. products_of_ints_after_index
# 3. get_products_of_all_ints_except_at_index

# To get the first one, we keep track of the total product so far going forwards,
# to get the second one, we keep track of the total product so far going backwards

# we want the product of all integers before an index and the product of all integers after an index.
# we just need to mulitply every integer in products_of_ints_before_index
# with the integer at the same index of products_of_ints_after_index

# [  1,   1,  2,  12, 60]
# [540, 270, 45,   9,  1]
# [540, 270, 90, 108, 60]

# and this gives us what we're looking for:
# the products of all integers except the integer at each index
# knowing this, can we eliminate any of the arrays to reduce the memory we use?
# instead of building the second array products_of_int_after_index,
# we could take the product we would have stored and just multiply it by the matching integer in products_of_ints_before_index

# so in the above example, when we calculated the 0th 'product after index' (which is 540),
# we'd just multiply that by our first 'product before index' (1) instead of storing in a new array

# we only need 1 array, the products of all ints before index
# and then multiply those products with the products after each
# index to get our final result
