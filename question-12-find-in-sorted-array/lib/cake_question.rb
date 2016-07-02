require 'pry-byebug'

def binary_search(target, set)
  # we think of floor and ceiling as 'walls'
  # around the possibilities of our target so by -1
  # below we mean to start our wall 'to the left'
  # of the 0th index
  # we don't mean 'the last index'
  floor = -1
  ceiling = set.length
  # if there isn't at least 1 index between floor and ceiling
  # we've run out of guesses and the number must not be present
  while floor + 1 < ceiling
    # find the index ~halfway between floor and ceiling
    # we use integer division, so we'll never get a 'half index'
    distance = ceiling - floor
    half_distance = distance/2
    guess_index = floor + half_distance
    guess_value = set[guess_index]
    return true if guess_value == target
    if guess_value > target
      # target is to the left
      # so move the ceiling to the left
      ceiling = guess_index
    else
      # target is to the right
      # so move floor to the right
      floor = guess_index
    end
  end
  return false
end

# Given an array A of n elements with values or records A0 ... An−1 and target value T, the following subroutine uses binary search to find the index of T in A.[6]
def recursive_binary_search(target, set)
  # Set L to 0 and R to n − 1.
  # If L > R, the search terminates as unsuccessful. Set m (the position of the middle element) to the floor of (L + R) / 2.
  # If Am < T, set L to m + 1 and go to step 2.
  # If Am > T, set R to m − 1 and go to step 2.
  # If Am = T, the search is done; return m.
  left = 0
  right = set.length - 1
  return false if left > right
  halfway = (set.length-1)/2
  if set[halfway] < target
    left = set[halfway + 1]
    return recursive_binary_search(target, set[(halfway+1)..-1])
  elsif set[halfway] > target
    right = set[halfway]
    return recursive_binary_search(target, set[0..(halfway - 1)])
  end
  return set[halfway] if set[halfway] == target
end
