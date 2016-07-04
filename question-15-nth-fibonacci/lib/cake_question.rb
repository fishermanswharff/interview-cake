require 'pry-byebug'

# initial recursive solution,
# has horrible costs due to
# enormous call stack O(2^n)
def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib(n-1) + fib(n-2)
end

# memoize the fib calculations
# and it saves you an order of
# magnitude, O(n) time
class Proc
  def memoize
    cache = {}
    -> (*args){ cache[args] = self[*args] unless cache.has_key?(args); cache[args] }
  end
end

# Bottom up approach gives you
# O(n) time and O(1) space.
def fibonacci(n)
  # n can't be less than 0
  if n < 0
    raise Exception, 'n is less than Zero.'
    # just return 0 or 1
  elsif n == 0 || n == 1
    return n
  end

  # n - 2 starts at 0 (the first fib number)
  prev_prev = 0
  # n - 1 starts at 1 (the second fib number)
  prev = 1

  # current initially starts at 1 (the third fib number)
  current = prev + prev_prev

  # .times is exclusive
  (n - 1).times do
    current = prev + prev_prev
    prev_prev = prev
    prev = current
  end
  # current is the nth fib number
  return current
end
