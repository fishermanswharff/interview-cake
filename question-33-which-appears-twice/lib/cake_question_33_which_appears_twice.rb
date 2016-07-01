require 'pry-byebug'

# I have an array where every number in the range 1...n appears once except for one number which appears twice.
# assume the array is ordered 1..n
# the one duplicate is somewhere in the array.
def dupe(array)
  n = array.length - 1
  sum = ((n * n) + n) / 2
  return array.reduce(&:+) - sum
  # array.each_with_object({}) { |i,o| o[i.to_s] ? o[i.to_s] += 1 : o[i.to_s] = 1 }.keep_if { |k,v| v > 1 }.to_a[0][0].to_i
end
