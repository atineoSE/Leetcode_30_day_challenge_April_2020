/*:
[Day 15: 15/04/2020](https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/529/week-2/3299/)

# Product of Array Except Self

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:
-----------
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

 Note:
-----------
 Please solve it without division and in O(n).

 Follow up:
-----------
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 
 */

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        return []
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [1,2,3,4]
        let expectedOutput = [24,12,8,6]
        let actualOutput = solution.productExceptSelf(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

