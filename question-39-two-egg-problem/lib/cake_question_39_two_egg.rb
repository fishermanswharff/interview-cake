def floor
  # we could use binary and start at 50, but that would give us, at worst, 50 drops
  # we could get down to at worst 19 drops by starting at 10, and moving up 10 every time an egg didn't break.
  # however, every time we drop an egg, our max number of drops goes up by one.
  # we'll use the first egg to get a range of possible floors that contain the highest floor an egg can be dropped.
  # when the first egg breaks, we'll use the second egg to find the exact floor an egg can be dropped from.
  # n + (n-1) + (n-2) + (n-3) + (n-4) + (n-5) + (n-6) + … + 1 = 100
  # the left side of this equation is what's known as a triangular series.
  # which can reduce down to the equation:
  # n * (n+1) / 2 = 100
  # n solves to give 13.651
  # we round up to 14 just to be safe.
  # we start at the 14th floor.
  # if the egg doesn't break there, we go up n - 1 (13) floors to floor 27.
  # and so on, going up 1 less floor each time.
  # ——————————————————————————————————————
  # highest floor an egg won't break from
  # 13

  # floors we drop first egg from
  # 14

  # floors we drop second egg from
  # 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13

  # total number of drops
  # 14
  # ——————————————————————————————————————
  # highest floor an egg won't break from
  # 98
  #
  # floors we drop first egg from
  # 14, 27, 39, 50, 60, 69, 77, 84, 90, 95, 99
  #
  # floors we drop second egg from
  # 96, 97, 98
  #
  # total number of drops
  # 14
end
