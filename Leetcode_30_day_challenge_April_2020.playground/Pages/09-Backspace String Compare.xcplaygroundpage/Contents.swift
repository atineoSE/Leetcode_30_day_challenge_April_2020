/*:
[Day 9: 09/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3291/)

 # Backspace String Compare
 
 Given two strings `S` and `T`, return if they are equal when both are typed into empty text editors. `#` means a backspace character.

 Example 1:
-----------
 Input: `S = "ab#c"`, `T = "ad#c"`
 
 Output: true
 
 Explanation: Both `S` and `T` become `"ac"`.
 
 Example 2:
------------
 Input: `S = "ab##"`, `T = "c#d#"`
 
 Output: true
 
 Explanation: Both `S` and `T` become `""`.
 
 Example 3:
-----------
 Input: `S = "a##c"`, `T = "#a#c"`
 
 Output: true
 
 Explanation: Both `S` and `T` become `"c"`.
 
 Example 4:
----------
 Input: `S = "a#c"`, `T = "b"`
 
 Output: false
 
 Explanation: `S` becomes `"c"` while `T` becomes `"b"`.
 
 Note:
--------
 * 1 <= S.length <= 200
 * 1 <= T.length <= 200
 * `S` and `T` only contain lowercase letters and `#` characters.
 
 Follow up:
----------
 * Can you solve it in O(N) time and O(1) space?
 */

import Foundation

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    // Time: O(N)
    // Space: O(1)
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        
        assert(S.count > 0)
        assert(T.count > 0)
        
        var idxS = S.count-1
        var idxT = T.count-1
  
        while true {
            let charS: String?
            let charT: String?
            (charS, idxS) = nextFreeChar(S, index: idxS)
            myPrint("S: (\(String(describing: charS)), \(idxS))")
            (charT, idxT) = nextFreeChar(T, index: idxT)
            myPrint("T: (\(String(describing: charT)), \(idxT))")
            
            if charS == nil && charT != nil { return false }
            if charS != nil && charT == nil { return false }
            if idxS == -1 && idxT == -1 { return true }
            if let charS = charS, let charT = charT, charS != charT { return false }
        }
    }
    
    private func nextFreeChar(_ str: String, index: Int) -> (String?, Int) {
        var charsToExplore = 1
        var currentIndex = index
        var currentChar: String? = nil

        while charsToExplore > 0 && currentIndex >= 0 {
            currentChar = str.string(at: currentIndex)!
            if currentChar == "#" {
                charsToExplore += 2
            }
            currentIndex -= 1
            charsToExplore -= 1
        }

        if charsToExplore > 0 {
            return (nil, currentIndex)
        } else {
            return (currentChar, currentIndex)
        }
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
    
    @objc func testE() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("ka##c", "k#a#c")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("bxj##tw", "bxo#j##tw")
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testG() {
        let solution = Solution()
        let expectedOutput = true
        let actualOutput = solution.backspaceCompare("xywrrmp", "xywrrmu#p")
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testH() {
        let solution = Solution()
        let expectedOutput = false
        let actualOutput = solution.backspaceCompare("bxj##tw", "bxj###tw")
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}
TestCase()



