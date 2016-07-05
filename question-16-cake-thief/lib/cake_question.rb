require 'pry-byebug'

def max_duffel_bag_value(cake_arrays, capacity)
  max_values = [0] * (capacity + 1)
  (0..capacity).each do |current_capacity|
    current_max_value = 0
    cake_arrays.each do |weight, value|
      return Float::INFINITY if (weight == 0 && value != 0)
      if weight <= current_capacity
        max_value_using_cake = value + max_values[current_capacity - weight]
        current_max_value = [max_value_using_cake, current_max_value].max
      end
    end
    max_values[current_capacity] = current_max_value
  end
  return max_values[capacity]
end


# def max_duffel_bag_value(cake_arrays, capacity)
#   # lets start with finding the most of any one cake we can hold that will be the most valuable
#   profit = 0
#   leftover_capacity = capacity
#   while leftover_capacity > 0
#     best_combo, cakes, leftover = best_cake(cake_arrays, leftover_capacity)
#     leftover_capacity = leftover_capacity - best_combo[0]
#     profit += best_combo[1]
#   end
#   return profit
# end

# def best_cake(cake_arrays, capacity)
#   max_number_of_cake_to_hold = cake_arrays.map { |weight, value| capacity / weight }
#   highest_profit_from_each_cake = max_number_of_cake_to_hold.map.with_index { |number, i| number * cake_arrays[i][1] }
#   number_of_most_profitable, amount_of_most_profitable = cake_arrays.slice!(highest_profit_from_each_cake.index(highest_profit_from_each_cake.max))
#   leftover_space = capacity % number_of_most_profitable
#   best_cake = max_number_of_cake_to_hold.zip(highest_profit_from_each_cake).sort_by { |a| a[1] }.last
#   weight_of_best_cake = best_cake[0] * number_of_most_profitable
#   return [weight_of_best_cake, best_cake[1]], cake_arrays, leftover_space
# rescue ZeroDivisionError
#   return [0,0], cake_arrays, leftover_space
# end
