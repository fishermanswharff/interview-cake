'use strict';
var getProductsExceptIndex = function(array){
  var productsOfIntsExceptAtIndex = function(a){
    var arr = [];
    for(var i = 0; i < a.length; i++){
      arr.push(1);
    }
    return arr;
  };
  var products = productsOfIntsExceptAtIndex(array);
  var product = 1;
  var i = 0;
  while(i < array.length){
    products[i] = product;
    product = product * array[i];
    i++;
  }
  product = 1;
  i = array.length - 1;
  while(i >= 0){
    products[i] = products[i] * product;
    product = product * array[i];
    i--;
  }
  return products
};