/*:
[Day 14: 14/04/2020](https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/529/week-2/3299/)

# Perform String Shifts
 
 You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:

 direction can be 0 (for left shift) or 1 (for right shift).
 amount is the amount by which string s is to be shifted.
 A left shift by 1 means remove the first character of s and append it to the end.
 Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
 Return the final string after all operations.

 Example 1:
----------
 Input: s = "abc", shift = [[0,1],[1,2]]
 Output: "cab"
 Explanation:
 [0,1] means shift to left by 1. "abc" -> "bca"
 [1,2] means shift to right by 2. "bca" -> "cab"
 
 Example 2:
----------
 Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
 Output: "efgabcd"
 Explanation:
 [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
 [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
 [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
 [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
  

 Constraints:
----------
 1 <= s.length <= 100
 s only contains lower case English letters.
 1 <= shift.length <= 100
 shift[i].length == 2
 0 <= shift[i][0] <= 1
 0 <= shift[i][1] <= 100
 
 */

import Foundation

func myPrint(_ arg: Any) {
    print(arg)
}

class Solution {
    func reduceShifts(_ shift: [[Int]]) -> Int {
        return shift.reduce(0) { (prev, next) -> Int in
            return next[0] == 0 ? prev + next[1] : prev - next[1]
        }
    }
    
    func shiftLeft(_ s: String, _ positions: Int) -> String {
        return s.string(from: positions, upTo: s.count)! + s.string(from: 0, upTo: positions)!
    }
    
    func shiftRight(_ s: String, _ positions: Int) -> String {
        return s.string(from: s.count - positions, upTo: s.count)! + s.string(from: 0, upTo: s.count - positions)!
    }
    
    func stringShift(_ s: String, _ shift: [[Int]]) -> String {
        let shifts = reduceShifts(shift)
        //myPrint(shifts)
        let normalizedShifts = abs(shifts) % s.count
        //myPrint(normalizedShifts)
        
        if normalizedShifts == 0 {
            return s
        }
        
        if shifts > 0 {
            return shiftLeft(s,  normalizedShifts)
        } else {
            return shiftRight(s, normalizedShifts)
        }
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let expectedOutput = "cab"
        let actualOutput = solution.stringShift("abc", [[0,1], [1,2]])
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testB() {
        let solution = Solution()
        let expectedOutput = "efgabcd"
        let actualOutput = solution.stringShift("abcdefg", [[1,1], [1,1], [0,2], [1,3]])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let expectedOutput = "yisxjwry"
        let actualOutput = solution.stringShift("yisxjwry", [[1,8],[1,4],[1,3],[1,6],[0,6],[1,4],[0,2],[0,1]])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
}

TestCase()
