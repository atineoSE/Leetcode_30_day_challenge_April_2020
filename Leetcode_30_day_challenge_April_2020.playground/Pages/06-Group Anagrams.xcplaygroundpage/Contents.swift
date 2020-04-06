/*:
[Day 6: 06/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3288/)


# Group Anagrams
 
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
 */

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        return [[]]
    }
}

class TestCase: XCTestCase {
    
    @objc func testA() {
        let solution = Solution()
        let input = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let expectedOutput = [
          ["ate","eat","tea"],
          ["nat","tan"],
          ["bat"]
        ]
        let actualOutput = solution.groupAnagrams(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
}

TestCase()
