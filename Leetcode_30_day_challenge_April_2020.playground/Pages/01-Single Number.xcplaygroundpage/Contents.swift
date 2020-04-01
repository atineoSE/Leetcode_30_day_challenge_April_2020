/*:
 [Day 1: 01/04/2020](https://leetcode.com/explore/other/card/30-day-leetcoding-challenge/528/week-1/3283/)
 
 
 # Single Number
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return 0
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [2,2,1]
        let expectedOutput = 1
        let actualOutput = solution.singleNumber(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = [4,1,2,1,2]
        let expectedOutput = 4
        let actualOutput = solution.singleNumber(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

