def find_unique_id(delivery_id_confirmations)
  hash = delivery_id_confirmations.each_with_object({}) { |i,o| o[i].nil? ? o[i] = 1 : o[i] += 1 }
  hash.reject! { |k,v| v > 1 }
  hash.keys.first
end
