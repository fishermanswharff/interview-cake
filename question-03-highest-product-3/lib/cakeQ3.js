'use strict';
class HighestProductOf3 {
  constructor(array) {
    if(array.length < 3) return console.log('Array must be equal to or longer than 3 integers');
    this.array = array;
    this.lowest = Math.min(array[0], array[1]);
    this.highest = Math.max(array[0], array[1]);
    this.lowestProductOf2 = array[0] * array[1];
    this.highestProductOf2 = array[0] * array[1];
    this.highestProductOf3 = array[0] * array[1] * array[2];
  };

  iterate() {
    let i = 2
    while(i < this.array.length){
      this.highestProductOf3 = Math.max(this.highestProductOf3, this.array[i] * this.highestProductOf2, this.array[i] * this.lowestProductOf2);
      this.highestProductOf2 = Math.max(this.highestProductOf2, this.array[i] * this.highest, this.array[i] * this.lowest);
      this.lowestProductOf2 = Math.min(this.lowestProductOf2, this.array[i] * this.highest, this.array[i] * this.lowest);
      this.highest = Math.max(this.highest, this.array[i]);
      this.lowest = Math.min(this.lowest, this.array[i]);
      i++;
    }
    return this.highestProductOf3;
  }
};

export default HighestProductOf3;