/*:
[Day 18: 18/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3303/)

# Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:
----------
 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 */

import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        return 0
    }
}


class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [[1,3,1],[1,5,1],[4,2,1]]
        let expectedOutput = 7
        let actualOutput = solution.minPathSum(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
