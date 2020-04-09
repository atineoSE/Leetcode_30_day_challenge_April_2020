/*:
[Day 9: 09/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3291/)

 # Backspace String Compare
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Example 1:
-----------
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 
 Example 2:
------------
 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 
 Example 3:
-----------
 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 
 Example 4:
----------
 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 
 Note:
--------
 1 <= S.length <= 200
 1 <= T.length <= 200
 S and T only contain lowercase letters and '#' characters.
 
 Follow up:
----------
 Can you solve it in O(N) time and O(1) space?
 */

import Foundation


class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return false
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("ab#c", "ad#c")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("ab##", "c#d#")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("a##c", "#a#c")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let expectedOutput = false
        let actualOutput = solution.backspaceCompare("a#c", "b")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}
TestCase()
