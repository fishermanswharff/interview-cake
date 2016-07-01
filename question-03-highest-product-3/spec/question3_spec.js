import HighestProductFrom3 from '../lib/cakeQ3'

describe('highestProductFrom3', () => {

  let array, array2, array3, array4, iterator1, iterator2, iterator3, iterator4;

  beforeEach(() => {
    array = [2,1,4,3,7,34,12,87,45,39,6,5,23];
    array2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
    array3 = [2,3,4,5];
    array4 = [-10,-10,1,3,2];

    iterator1 = new HighestProductFrom3(array);
    iterator2 = new HighestProductFrom3(array2);
    iterator3 = new HighestProductFrom3(array3);
    iterator4 = new HighestProductFrom3(array4);
  });

  it('should return the highest product from 3 numbers of the array', () => {
    expect(iterator1.iterate()).toEqual(152685);
    expect(iterator2.iterate()).toEqual(2184);
    expect(iterator3.iterate()).toEqual(60);
    expect(iterator4.iterate()).toEqual(300);
  });

  afterEach(() => {
    array = null;
    array2 = null;
    array3 = null;
    array4 = null;

    iterator1 = null;
    iterator2 = null;
    iterator3 = null;
    iterator4 = null;
  });
});
