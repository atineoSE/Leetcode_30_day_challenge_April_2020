/*:
[Day 16: 16/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3301/)

# Valid Parenthesis String

 Given a string containing only three types of characters: `(`, `)` and `*`, write a function to check whether this string is valid. We define the validity of a string by these rules:
 * Any left parenthesis `(` must have a corresponding right parenthesis `)`.
 * Any right parenthesis `)` must have a corresponding left parenthesis `(`.
 * Left parenthesis `(` must go before the corresponding right parenthesis `)`.
 `*` could be treated as a single right parenthesis `)` or a single left parenthesis `(` or an empty string.
 * An empty string is also valid.
 
 Example 1:
-----------
 Input: `"()"`
 
 Output: True
 
 Example 2:
-----------
 Input: `"(*)"`
 
 Output: True
 
 Example 3:
-----------
 Input: `"(*))"`
 
 Output: True
 
 Note:
-----------
 * The string size will be in the range [1, 100].
 
*/

import Foundation

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    
    func hasMatchingParenthesis(_ s: String) ->  Bool {
        myPrint("\"\(s)\"")
        
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
    
    func traverseString(_ s: String, _ level: Int) -> Bool {
        guard level != 0 else {
            return hasMatchingParenthesis(s)
        }
        guard !canBePruned(s) else { return false }
        
        //post-order traversal
        let firstMatchIndex = s.firstIndex { String($0) == "*" }
        if let firstMatchIndex = firstMatchIndex {
            let head = s[s.startIndex..<firstMatchIndex]
            var tail = ""
            if let nextIndex = s.index(from: firstMatchIndex, offsetBy: 1) {
                tail = String(s[nextIndex...])
            }
            
            let s2a = head + "" + tail
            if traverseString(s2a, level-1) {
                return true
            }
            
            let s2b = head + "(" + tail
            if traverseString(s2b, level-1) {
                return true
            }
            
            let s2c = head + ")" + tail
            if traverseString(s2c, level-1) {
                return true
            }
        }
        return false
    }
    
    func checkValidStringRecursive(_ s: String) -> Bool {
        let numLevels = s.reduce(0) { String($1) == "*" ? $0 + 1 : $0 }
        return traverseString(s, numLevels)
    }
    
    // Check python notebook for explanation
    func checkValidStringGreedy(_ s: String) -> Bool {
        var low = 0     // minimum number of unmatched left parenthesis
        var high = 0    // maximum number of unmatched left parenthesis
    
        var i = 0
        while i < s.count {
            let currentChar = s.string(at: i)!
            if currentChar == "(" {
                low += 1
            } else {
                low -= 1
                if low < 0 {
                    low = 0 // make zero if going negative
                }
            }
            if currentChar == "(" || currentChar == "*" {
                high += 1
            } else {
                high -= 1
            }
            
            myPrint("low = \(low), high = \(high)")
            
            if high < low {
                return false
            }
            
            i += 1
        }
        
        return low == 0
    }
    
    func checkValidString(_ s: String) -> Bool {
        //return checkValidStringRecursive(s)
        return checkValidStringGreedy(s)
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

 
    // MARK: Performance tests
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



