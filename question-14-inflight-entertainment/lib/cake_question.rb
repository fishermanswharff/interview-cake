require 'pry-byebug'
# Assume your users will watch exactly two movies
# Don't make your users watch the same movie twice
# Optimize for runtime over memory
def inflight(mins, movie_times)
  movie_times.each_with_index do |time, i|
    tmp = movie_times.dup
    tmp.slice!(i)
    diff = mins - time
    return true if tmp.include? diff
  end
  return false
end
