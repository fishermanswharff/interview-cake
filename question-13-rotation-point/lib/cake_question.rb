require 'pry-byebug'

def recursive_rotation_point(array)
  left = 0
  right = array.length - 1
  return array[left] if array[right] > array[left]
  halfway = (array.length - 1)/2
  return array[right] if left + 1 == right
  if array[halfway] < array[left]
    return recursive_rotation_point(array[0..halfway])
  else
    return recursive_rotation_point(array[halfway..-1])
  end
end

def rotation_point(array)
  first_word = array[0]
  last_word = array[-1]
  return 0 if last_word > first_word
  floor_index = 0
  ceiling_index = array.length - 1
  while floor_index < ceiling_index
    # guess a point halfway between floor and ceiling
    guess_index = floor_index + ((ceiling_index - floor_index) / 2)
    # if guess comes after first word
    if array[guess_index] > first_word
      # go right
      floor_index = guess_index
    else
      # go left
      ceiling_index = guess_index
    end
    # if floor and ceiling have converged
    if floor_index + 1 == ceiling_index
      # between floor and ceiling is where we flipped to the beginning
      # so ceiling is alphabetically first
      return ceiling_index
    end
  end
end
