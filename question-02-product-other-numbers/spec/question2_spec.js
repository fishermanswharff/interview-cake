'use strict';

describe('Interview Cake Question 2', function(){
  it('returns the product of every integer except the integer at that index',function(){
    var array1 = [1,2,6,5,9];
    expect(getProductsExceptIndex(array1)).toEqual([540,270,90,108,60]);
  });

  it('does it again', function(){
    var array2 = [1,7,3,4];
    expect(getProductsExceptIndex(array2)).toEqual([84,12,28,21]);
  });
});