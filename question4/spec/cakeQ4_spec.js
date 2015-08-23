import ClassName from '../lib/cakeQ4'

describe('class', () => {

  // setup
  let value, intance;
  beforeEach(() => {
    value = 'some value';
    instance = new ClassName(value);
  });

  // assert
  it('should return the highest product from 3 numbers of the array', () => {
    // exercise
    expect(instance.doSomething()).toEqual('something');
  });

  // teardown
  afterEach(() => {
    value = null;
    instance = null;
  });
});
