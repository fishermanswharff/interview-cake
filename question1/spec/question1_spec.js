'use strict';

describe('Interview Cake Question 1', function(){
  it('returns the highest profit from yesterday’s stock prices', function(){
    var stock_prices_yesterday = [490,489,487,488,475,489,450,490,491,492,493,494,497,500,467,490,504,506,508,497,499,520,534,576,587,599,620,602,604,603,587,596,595,593,591,540];
    expect(highestProfit(stock_prices_yesterday)).toEqual(170);
  });
});