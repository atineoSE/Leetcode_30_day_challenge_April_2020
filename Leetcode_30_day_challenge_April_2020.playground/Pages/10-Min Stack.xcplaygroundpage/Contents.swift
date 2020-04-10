/*:
[Day 10: 10/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3292/)

 # Min Stack
 
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
  
 Example:
---------
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.

 */

import Foundation

class MinStack {

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
    }
    
    func pop() {
        
    }
    
    func top() -> Int {
        return 0
    }
    
    func getMin() -> Int {
        return 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

class TestCase: XCTestCase {
    @objc func testA() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        XCTAssertEqual(minStack.getMin(), -3)
        minStack.pop();
        XCTAssertEqual(minStack.top(), 0)
        XCTAssertEqual(minStack.getMin(), -2)
    }
}
TestCase()
