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

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        assert(nums.count > 0)

        return maxSubArrayA(nums)
    }
    
    // Time: O(nlogn)
    // Space: O(n)
    private func maxSubArrayA(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        myPrint(maxSum)
        var i = 0
        while i < nums.count {
            var j = i + 1
            var newSum = nums[i]
            if newSum > maxSum {
                maxSum = newSum
                myPrint("update max to \(maxSum)")
            }
            myPrint("i: \(i), j: \(j), newSum: \(newSum)")
            while j < nums.count {
                newSum += nums[j]
                myPrint("i: \(i), j: \(j), newSum: \(newSum)")
                if newSum > maxSum {
                    maxSum = newSum
                    myPrint("update max to \(maxSum)")
                }
                j += 1
            }
            myPrint("")
            i += 1
        }
        return maxSum
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
    
    @objc func testB() {
        let solution = Solution()
        let input = [4,-1,2,1,-5]
        let expectedOutput = 6
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = [4,-1,2]
        let expectedOutput = 5
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let input = [4,-1,2,-5]
        let expectedOutput = 5
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testE() {
        let solution = Solution()
        let input = [4,-1,2,-5,7]
        let expectedOutput = 7
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let input = [4,-1,2,1,-5,2,3,4]
        let expectedOutput = 10
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testG() {
        let solution = Solution()
        let input = [-1]
        let expectedOutput = -1
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testH() {
        let solution = Solution()
        let input = [-2,1]
        let expectedOutput = 1
        let actualOutput = solution.maxSubArray(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
}

TestCase()
