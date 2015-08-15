'use strict';
var highestProfit = function(array){
  var min_price = array[0],
      max_profit = 0;
  for(var i = 0; i < array.length - 1; i++){
    min_price = Math.min(min_price, array[i]);
    max_profit = Math.max(max_profit, array[i] - min_price);
  }
  return max_profit
};