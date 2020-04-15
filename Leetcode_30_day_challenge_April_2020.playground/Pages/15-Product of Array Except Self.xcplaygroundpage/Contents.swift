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
        return productExceptSelfWithDivision(nums)
        //return productExceptSelfDoublyNestedLoop(nums)
    }
    
    // Time: O(n)
    // Space: O(n)
    func productExceptSelfWithDivision(_ nums: [Int]) -> [Int] {
        var numZeros = 0
        var idx = 0
        var idxForZero = -1
        while numZeros < 2 && idx < nums.count {
            if nums[idx] == 0 {
                numZeros += 1
                idxForZero = idx
            }
            idx += 1
        }
        
        if numZeros == 2 {
            return Array.init(repeating: 0, count: nums.count)
        }
        
        if numZeros == 1 {
            var output = Array.init(repeating: 0, count: nums.count)
            output[idxForZero] = nums[0..<idxForZero].reduce(1,*) * nums[(idxForZero+1)...].reduce(1,*)
            return output
        }
        
        let totalProduct = nums.reduce(1, *)
        return nums.map { Int(Float(totalProduct)/Float($0)) }
    }
    
    
    // Time: O(n^2)
    // Space: O(n)
    func productExceptSelfDoublyNestedLoop(_ nums: [Int]) -> [Int] {
        var output = Array.init(repeating: 1, count: nums.count)
        var i = 0
        while i < nums.count {
            var j = 0
            let a = nums[i]
            while j < output.count {
                if i != j {
                    output[j] *= a
                }
                j += 1
            }
            i += 1
        }
        return output
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
    
    @objc func testB() {
        let solution = Solution()
        let input = [1,0,3,4]
        let expectedOutput = [0,12,0,0]
        let actualOutput = solution.productExceptSelf(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = [1,0,3,0]
        let expectedOutput = [0,0,0,0]
        let actualOutput = solution.productExceptSelf(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let input = [1,2,3,0]
        let expectedOutput = [0,0,0,6]
        let actualOutput = solution.productExceptSelf(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

