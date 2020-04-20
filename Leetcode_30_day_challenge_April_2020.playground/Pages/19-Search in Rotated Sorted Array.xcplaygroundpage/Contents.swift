/*:
[Day 19: 19/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3304/)

# Search in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:
------------
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
-----------
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 */

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return 0
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let expectedOutput = 4
        let actualOutput = solution.search([4,5,6,7,0,1,2], 0)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let expectedOutput = -1
        let actualOutput = solution.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
