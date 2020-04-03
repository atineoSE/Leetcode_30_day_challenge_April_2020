/*:
 [Day 3: 03/04/2020](https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3285/)
 
 
 # Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Follow up:
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 */


import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return 0
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [-2,1,-3,4,-1,2,1,-5,4]
        let expectedOutput = 6
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
