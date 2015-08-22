require 'pry'

def condense_meetings(assoc_array)
  sorted = assoc_array.sort
  merged_meetings = []
  previous_start, previous_end = sorted[0]
  sorted[1..-1].each do |current_start, current_end|
    if current_start <= previous_end
      previous_end = [current_end, previous_end].max
    else
      merged_meetings.push([previous_start, previous_end])
      previous_start, previous_end = current_start, current_end
    end
  end
  merged_meetings.push([previous_start, previous_end])
  merged_meetings
end

=begin
Your company built an in-house calendar tool called HiCal.
You want to add a feature to see the times in a day when
everyone is available.

To do this, you’ll need to know when any team is having a
meeting. In HiCal, a meeting is stored as a tuple of integers
(start_time, end_time). These integers represent the number
of 30-minute blocks past 9:00am.

(2, 3) # meeting from 10:00 – 10:30 am
(6, 9) # meeting from 12:00 – 1:30 pm

Write a function condense_meeting_times() that takes an array
of meeting time ranges and returns an array of condensed ranges.

For example, given:
[(0, 1), (3, 5), (4, 8), (10, 12), (9, 10)]

your function would return:
[(0, 1), (3, 8), (9, 12)]

Do not assume the meetings are in order.
The meeting times are coming from multiple teams.

In this case the possibilities for start_time and end_time are
bounded by the number of 30-minute slots in a day. But soon you
plan to refactor HiCal to store times as Unix timestamps (which
are big numbers). Write something that's efficient even when we
can't put a nice upper bound on the numbers representing our
time ranges.

 Look at this case:
[(1, 2), (2, 3)]

These meetings should probably be merged, although they don't
exactly "overlap"—they just "touch." Does your function do this?

Look at this case:
[(1, 5), (2, 3)]

Notice that although the second meeting starts later, it ends before
the first meeting ends. Does your function correctly handle the case
where a later meeting is "subsumed by" an earlier meeting?

Look at this case:
[(1, 10), (2, 6), (3, 5), (7, 9)]

Here all of our meetings should be merged together into just (1, 10).
We need keep in mind that after we've merged the first two we're not
done with the result—the result of that merge may itself need to be
merged into other meetings as well.

Make sure that your function won't "leave out" the last meeting.

We can do this in O(nlogn) time.

We can tell the meetings overlap because the end time of the first
meeting is AFTER or THE SAME AS the start of the second meeting. The first
meeting here should be the meeting that starts first.

Be sure to consider these edge cases:
The end time of the first meeting and the start time of the second
meeting are equal. For example: [(1, 2), (2, 3)]

1.  We treat the FIRST meeting as the one with the earlier start time
2.  If the first meeting's end time is greater than or equal to the start
    time of the second, we merge the two meeting times into one range. The
    resulting time range's start time is the earlier of the two meetings,
    and the end time is the later of the two end times.
3.  Else, we leave them separate

=end










