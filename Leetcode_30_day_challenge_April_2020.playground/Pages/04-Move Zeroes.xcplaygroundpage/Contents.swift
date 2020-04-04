/*:
 [Day 4: 04/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3286/)
 
 
 # Move Zeroes
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */


import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        return
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        var input = [0,1,0,3,12]
        let expectedOutput = [1,3,12,0,0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, expectedOutput)
    }

}

TestCase()
