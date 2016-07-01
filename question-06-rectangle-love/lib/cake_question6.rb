require 'pry'
# def love_rectangle(rect1, rect2)
#   x1,y1,w1,h1 = rect1[:x], rect1[:y], rect1[:w], rect1[:h]
#   x2,y2,w2,h2 = rect2[:x], rect2[:y], rect2[:w], rect2[:h]
#   x = [x1,x2].max
#   y = [y1,y2].max
#   greater_x = x1 > x2 ? rect1 : rect2
#   lesser_x = x1 < x2 ? rect1 : rect2
#   greater_y = y1 > y2 ? rect1 : rect2
#   lesser_y = y1 < y2 ? rect1 : rect2
#   greater_width = w1 > w2 ? rect1 : rect2
#   lesser_width = w1 < w2 ? rect1 : rect2
#   greater_height = h1 > h2 ? rect1 : rect2
#   lesser_height = h1 < h2 ? rect1 : rect2
#   w = x_overlap(greater_x, lesser_x)
#   h = y_overlap(greater_y, lesser_y)
#   return { x: x, y: y, w: w, h: h }
#   # width: the greater of the two Xs, then add the difference between the width of the other rect - other rect starting x
# end

# def x_overlap(greater_x, lesser_x)
#   if greater_x[:x] - (lesser_x[:x] + lesser_x[:w]) > 0
#     raise 'No X Overlap'
#   else
#     return [(lesser_x[:x] + lesser_x[:w]) - greater_x[:x], greater_x[:w]].min
#   end
# end

# def y_overlap(greater_y, lesser_y)
#   if greater_y[:y] - (lesser_y[:y] + lesser_y[:h]) > 0
#     raise 'No Y Overlap'
#   else
#     return [(lesser_y[:y] + lesser_y[:h]) - greater_y[:y], greater_y[:h]].min
#   end
# end

def love_rectangle(rect1, rect2)
  x_overlap_point, overlap_width = range_overlap(rect1[:x], rect1[:w], rect2[:x], rect2[:w])
  y_overlap_point, overlap_height = range_overlap(rect1[:y], rect1[:h], rect2[:y], rect2[:h])
  if !overlap_width || !overlap_height
    return {
      x: nil,
      y: nil,
      w: nil,
      h: nil
    }
  end

  return {
    x: x_overlap_point,
    y: y_overlap_point,
    w: overlap_width,
    h: overlap_height
  }
end

def range_overlap(p1, l1, p2, l2)
  highest_start_point = [p1,p2].max
  lowest_end_point = [p1+l1, p2+l2].min
  return [nil,nil] if highest_start_point > lowest_end_point
  overlap = lowest_end_point - highest_start_point
  return [highest_start_point, overlap]
end
