/*:
[Day 6: 06/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3288/)

# Group Anagrams
 
Given an array of strings, group anagrams together.

Example:
---------
Input: ["eat", "tea", "tan", "ate", "nat", "bat"]
 
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
 
Note:
* All inputs will be in lowercase.
* The order of your output does not matter.
 */

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var bagOfWords: [String:[String]] = [:]
        
        for word in strs {
            let sortedWord = String(word.sorted())
            var array = bagOfWords[sortedWord]
            if array != nil {
                array!.append(word)
            } else {
                array = [word]
            }
            bagOfWords[sortedWord] = array
        }
        
        return Array(bagOfWords.values)
    }
}


class TestCase: XCTestCase {
    
    @objc func testA() {
        let solution = Solution()
        let input = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let expectedOutput = Set([
          Set(["ate","eat","tea"]),
          Set(["nat","tan"]),
          Set(["bat"])
        ])
        let actualOutput = solution.groupAnagrams(input)
        
        var convertedOutput: Set<Set<String>> = Set()
        for array in actualOutput {
            convertedOutput.insert(Set(array))
        }
        
        XCTAssertEqual(convertedOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = ["eat"]
        let expectedOutput = [["eat"]]
        let actualOutput = solution.groupAnagrams(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
}

TestCase()
