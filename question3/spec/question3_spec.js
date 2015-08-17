import Calculator from '../lib/cakeQ3'

describe('Calculator', () => {
  it('should add two numbers', () => {
    let calculator = new Calculator();
    let sum = calculator.add(1,4);
    expect(sum).toBe(5);
  });
});