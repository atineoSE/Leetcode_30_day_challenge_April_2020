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

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    
    func nonPivotedSearch(_ nums: [Int], _ l: Int, _ m: Int, _ h: Int, _ target: Int) -> Int {
        myPrint("nonPivoted: l: \(l), m: \(m), h: \(h), target: \(target)")
        
        if nums[m] == target { return m }
        if m == h { // last 2 elements
            return nums[l] == target ? l : -1
        }
        if (l == m) { // last 2 elements
            return nums[h] == target ? h : -1
        }
        
        if target < nums[m] {
            // go left
            return nonPivotedSearch(nums, l, l + (m-l)/2, m, target)
        } else {
            // go right
            return nonPivotedSearch(nums, m, m + (h-m)/2, h, target)
        }
    }
    
    func pivotedSearch(_ nums: [Int], _ l: Int, _ m: Int, _ h: Int, _ target: Int) -> Int {
        myPrint("Pivoted: l: \(l), m: \(m), h: \(h), target: \(target)")
        
        // A. We found the target
        if nums[m] == target { return m }
        
        // B. Array with last 2 elements
        if m == h {
            return nums[l] == target ? l : -1
        }
        if (l == m) {
            return nums[h] == target ? h : -1
        }
        
        // C. The pivot is m
        if nums[m-1] > nums[m] {
            if target > nums[m] && target <= nums[h] {
                // go right
                return nonPivotedSearch(nums, m, m + (h-m)/2, h, target)
            } else {
                // go left
                return nonPivotedSearch(nums, l, l + (m-l)/2, m, target)
            }
        }
        
        // D. The pivot is to the right
        if nums[l] < nums[m] {
            if target < nums[m] && target >= nums[l] {
                // go left non-pivoted
                return nonPivotedSearch(nums, l, l + (m-l)/2, m, target)
            } else {
                // go right pivoted
                return pivotedSearch(nums, m, m + (h-m)/2, h, target)
            }
        }
        
        // E. The pivot is to the left
        if target > nums[m] && target <= nums[h] {
            // go right non-pivoted
            return nonPivotedSearch(nums, m, m + (h-m)/2, h, target)
        } else {
            // go left pivoted
            return pivotedSearch(nums, l, l + (m-l)/2, m, target)
        }
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        
        let l = 0
        let h = nums.count-1
        let m = l + (h - l) / 2
        
        return pivotedSearch(nums, l, m, h, target)
    }
}

class TestCase: XCTestCase {

    @objc func testNonPivotedSearchA() {
        let solution = Solution()
        let input = [0,1,2,4,5,6,7]
        let target = 3
        let expectedOutput = -1
        let actualOutput = solution.nonPivotedSearch(input, 0, input.count/2, input.count-1, target)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testNonPivotedSearchB() {
        let solution = Solution()
        let input = [0,1,2,3,4,5,6,7]
        let target = 3
        let expectedOutput = 3
        let actualOutput = solution.nonPivotedSearch(input, 0, input.count/2, input.count-1, target)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testNonPivotedSearchC() {
        let solution = Solution()
        let input = [0,1,2,4,5,6,7]
        let target = 6
        let expectedOutput = 5
        let actualOutput = solution.nonPivotedSearch(input, 0, input.count/2, input.count-1, target)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
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
    
    @objc func testC() {
        let solution = Solution()
        let expectedOutput = 0
        let actualOutput = solution.search([6,7,1,2,3,4,5], 6)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

}

TestCase()
