'use strict';
class MeetingMerger {
  constructor(array){
    this.meetingTimes = array;
    this.sorted = array.sort();
    this.mergedMeetings = [];
    this.previousStart = this.sorted[0][0];
    this.previousEnd = this.sorted[0][1];
  };

  condenseTimes(){
    this.sorted.forEach(this.parseTimes, this);
    this.mergedMeetings.push([this.previousStart, this.previousEnd]);
    return this.mergedMeetings;
  };

  parseTimes(value,index){
    let current_start = value[0], current_end = value[1];
    if(current_start <= this.previousEnd){
      this.previousEnd = Math.max(current_end, this.previousEnd);
    } else {
      mergedMeetings.push([this.previousStart, this.previousEnd])
      this.previousStart, this.previousEnd = current_start, current_end;
    }
  };
}

export default MeetingMerger;