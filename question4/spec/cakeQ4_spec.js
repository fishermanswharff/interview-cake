import MeetingMerger from '../lib/cakeQ4'

describe('MeetingMerger', () => {

  let array1, array2, array3, array4, instance1, instance2, instance3, instance4;

  beforeEach(() => {
    array1 = [[1,3], [3,5]];
    array2 = [[1,10],[2,6],[4,5], [7,9]];
    array3 = [[3,5],[4,8],[10,12],[9,10],[0,1]];
    instance1 = new MeetingMerger(array1);
    instance2 = new MeetingMerger(array2);
    instance3 = new MeetingMerger(array3);
  });

  // assert
  it('condenses the meeting times if the times are touching', () => {
    expect(instance1.previousEnd).toEqual(3);
    expect(instance1.sorted).toEqual([[1,3], [3,5]]);
    expect(instance3.sorted).toEqual([[0,1],[3,5],[4,8],[9,10],[10,12]]);
    expect(instance1.condenseTimes()).toEqual([[1,5]]);
  });

  it('condenses the meeting from earliest start time to latest stop time', () => {});

  it('condenses the meeting times even when meeting times are not in order', () => {});

  // teardown
  afterEach(() => {
    array1 = null;
    instance1 = null;
  });
});
