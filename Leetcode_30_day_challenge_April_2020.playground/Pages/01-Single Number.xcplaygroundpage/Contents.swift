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
        return singleNumberNotUsingExtraMemory(nums)
    }
    
    private func singleNumberNotUsingExtraMemory(_ nums:[Int]) -> Int {
        let sortedNums = nums.sorted()
        var singleNumber: Int? = nil
        for current in sortedNums {
            if singleNumber != nil {
                if singleNumber! == current {
                    singleNumber = nil
                } else {
                    return singleNumber!
                }
            } else {
                singleNumber = current
            }
        }
        return singleNumber!
    }
    
    private func singleNumberUsingExtraMemory(_ nums:[Int]) -> Int {
        var nonMatched = Set<Int>()
        for n in nums {
            if nonMatched.remove(n) == nil {
                nonMatched.insert(n)
            }
        }
        return nonMatched.first!
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
    
    @objc func testC() {
        let solution = Solution()
        let input = [2,1,3,1,3]
        let expectedOutput = 2
        let actualOutput = solution.singleNumber(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

