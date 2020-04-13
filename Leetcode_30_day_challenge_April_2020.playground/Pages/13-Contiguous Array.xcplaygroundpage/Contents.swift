/*:
 [Day 12: 13/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3298/)
 
 # Contiguous Array
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 Example 1:
 -----------
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 
 Example 2:
 -------------
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 
 Note: The length of the given binary array will not exceed 50,000.
 */

import Foundation

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        return 0
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [0,1]
        let expectedOutput = 2
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = [0,1,0]
        let expectedOutput = 2
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
