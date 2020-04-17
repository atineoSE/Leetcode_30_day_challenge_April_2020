/*:
[Day 16: 16/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3301/)

# Valid Parenthesis String

 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

 Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 Any right parenthesis ')' must have a corresponding left parenthesis '('.
 Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
 An empty string is also valid.
 
 Example 1:
-----------
 Input: "()"
 Output: True
 
 Example 2:
-----------
 Input: "(*)"
 Output: True
 
 Example 3:
-----------
 Input: "(*))"
 Output: True
 
 Note:
-----------
 The string size will be in the range [1, 100].
 
*/

import Foundation

class Solution {
    func checkValidString(_ s: String) -> Bool {
        return false
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = "()"
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = "(*)"
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = "(*))"
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()



