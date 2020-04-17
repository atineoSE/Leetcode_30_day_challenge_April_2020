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
    
    func hasMatchingParenthesis(_ s: String) ->  Bool {
        //print("\"\(s)\"")
        
        var numUnmatchedLeftParenthesis = 0
        
        for c in s {
            let c2 = String(c)
            if c2 == "(" {
                numUnmatchedLeftParenthesis += 1
            } else if c2 == ")" {
                if numUnmatchedLeftParenthesis > 0 {
                    numUnmatchedLeftParenthesis -= 1
                } else {
                    // one right parenthesis too much
                    return false
                }
            } else {
                // it's *, we can't evaluate the string yet
                return false
            }
        }
        
        return numUnmatchedLeftParenthesis == 0
    }
    
    func canBePruned(_ s: String) -> Bool {
        var numUnmatchedLeftParenthesis = 0
        var remainingCharacters = s.count
        
        for c in s {
            let c2 = String(c)
            remainingCharacters -= 1
            if c2 == "*" {
                return false
            }
            
            if c2 == "(" {
                numUnmatchedLeftParenthesis += 1
                if numUnmatchedLeftParenthesis > remainingCharacters {
                    return true
                }
            } else {
                // it's ")"
                if numUnmatchedLeftParenthesis > 0 {
                    numUnmatchedLeftParenthesis -= 1
                } else {
                    // it's invalid and can be pruned
                    return true
                }
            }
            
        }
        
        return numUnmatchedLeftParenthesis > 0
    }
    
    func f(_ s: String, _ level: Int) -> Bool {
        guard level != 0 else {
            return hasMatchingParenthesis(s)
        }
        guard !canBePruned(s) else { return false }
        
        //post-order traversal
        let firstMatchIndex = s.firstIndex { String($0) == "*" }
        if let firstMatchIndex = firstMatchIndex {
            var tail = ""
            if let nextIndex = s.index(from: firstMatchIndex, offsetBy: 1) {
                tail = String(s[nextIndex...])
            }
            
            let s2a = s[s.startIndex..<firstMatchIndex] + "(" + tail
            if f(s2a, level-1) {
                return true
            }
            
            let s2b = s[s.startIndex..<firstMatchIndex] + ")" + tail
            if f(s2b, level-1) {
                return true
            }
            
            let s2c = s[s.startIndex..<firstMatchIndex] + "" + tail
            if f(s2c, level-1) {
                return true
            }
        }
        return false
    }
    
    func checkValidString(_ s: String) -> Bool {
        let numLevels = s.reduce(0) { String($1) == "*" ? $0 + 1 : $0 }
        return f(s, numLevels)
    }
}

class TestCase: XCTestCase {

    @objc func testMatchingParenthesis() {
        let solution = Solution()
        let inputs = ["", "()", "(())", "((()))"]
        let expectedOutput = true
        for input in inputs {
           let actualOutput = solution.hasMatchingParenthesis(input)
            if actualOutput != expectedOutput {
                XCTFail()
            }
        }
    }
    
    @objc func testNonMatchingParenthesis() {
        let solution = Solution()
        let inputs = ["(", "(()", ")", "())", "((("]
        let expectedOutput = false
        for input in inputs {
           let actualOutput = solution.hasMatchingParenthesis(input)
            if actualOutput != expectedOutput {
                XCTFail()
            }
        }
    }
    
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
    
    @objc func testD() {
        let solution = Solution()
        let input = ""
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testE() {
        let solution = Solution()
        let input = "*"
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let input = "**"
        let expectedOutput = true
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    // Performance test
    @objc func testG() {
        let solution = Solution()
        let input =  "(*())))()))))(()))))))(((())()())()*())))(((**)*()(()())(*)))(()*(*(())(())(()()())(()()*)((*()*))"
        let expectedOutput = false
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testH() {
        let solution = Solution()
        let input =  "(((((*(()((((*((**(((()()*)()()()*((((**)())*)*)))))))(())(()))())((*()()(((()((()*(())*(()**)()(())"
        let expectedOutput = false
        let actualOutput = solution.checkValidString(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

}

TestCase()



