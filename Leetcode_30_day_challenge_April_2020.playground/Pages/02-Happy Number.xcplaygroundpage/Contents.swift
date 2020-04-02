/*:
 [Day 2: 02/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3284/)
 
 
 # Happy Number
 
 Write an algorithm to determine if a number is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

 Example:

 Input: 19
 Output: true
 Explanation:
 1^2 + 9^2 = 82
 8^2 + 2^2 = 68
 6^2 + 8^2 = 100
 1^2 + 0^2 + 0^2 = 1
 */

import Foundation


class Solution {
    func isHappy(_ n: Int) -> Bool {
        return false
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = 19
        let expectedOutput = true
        let actualOutput = solution.isHappy(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

