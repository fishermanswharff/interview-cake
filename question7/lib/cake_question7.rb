require 'pry'
class TempTracker

  def initialize
    @min = nil
    @max = nil

    @total = 0
    @sum = 0.0
    @mean = nil

    @occurrences = [0] * 111
    @max_occurrences = 0
    @mode = nil
  end

  def insert(temp)
    if @max.nil? || temp > @max
      @max = temp
    end
    if @min.nil? || temp < @min
      @min = temp
    end

    @total += 1
    @sum += temp.to_f
    @mean = (@sum / @total).round(2)
    @occurrences[temp] += 1
    if @occurrences[temp] > @max_occurrences
      @mode = temp
      @max_occurrences = @occurrences[temp]
    end
  end

  def get_max
    @max
  end

  def get_min
    @min
  end

  def get_mean
    @mean
    # (temps.reduce(&:+).to_f / temps.length.to_f).round(2)
  end

  def get_mode
    @mode
    # temps.each_with_object({}) { |temp,hash| hash[temp.to_s].nil? ? hash[temp.to_s] = 1 : hash[temp.to_s] += 1 }.sort_by { |k,v| v }.last[0].to_i
  end
end
