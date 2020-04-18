/*:
[Day 17: 17/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3302/)

# Number of Islands
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:
------------
 Input:
 11110
 11010
 11000
 00000

 Output: 1
 
 Example 2:
------------
 Input:
 11000
 11000
 00100
 00011

 Output: 3

 */

import Foundation


func getChars(_ string: String) -> [[Character]] {
    var output:[[Character]] = []
    var currentRow: [Character] = []
    for char in string {
        if CharacterSet.whitespacesAndNewlines.contains(char.unicodeScalars.first!) {
            output.append(currentRow)
            currentRow = []
        } else {
            currentRow.append(char)
        }
    }
    output.append(currentRow)
    return output
}

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        return 0
    }
}

class TestCase: XCTestCase {

    @objc func testA() {
        let solution = Solution()
        let s = """
                11110
                11010
                11000
                00000
                """
        let input = getChars(s)
        let expectedOutput = 1
        let actualOutput = solution.numIslands(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let s = """
                11000
                11000
                00100
                00011
                """
        let input = getChars(s)
        let expectedOutput = 3
        let actualOutput = solution.numIslands(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

}

TestCase()
