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

// Space: O(N*M)
// Time: O((N*M)^2) worst case, but expected case O(N*M)
class Solution {
    func traverse(_ grid: [[Character]], _ i: Int, _ j: Int, _ visited: inout [[Bool]]) -> Bool {
        guard i < grid.count, i >= 0 else { return false }
        guard j < grid[0].count, j >= 0 else { return false }
        guard !visited[i][j] else { return false }
        guard grid[i][j] == Character("1") else { return false }
        
        visited[i][j] = true
        
        traverse(grid, i-1, j, &visited)
        traverse(grid, i, j-1, &visited)
        traverse(grid, i, j+1, &visited)
        traverse(grid, i+1, j, &visited)
        
        return true
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        
        var visited: [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: grid[0].count), count: grid.count)
        var i = 0
        var islandCount = 0
        while i < grid.count {
            var j = 0
            let row = grid[i]
            while j < row.count {
                if traverse(grid, i,j, &visited) {
                    islandCount += 1
                }
                j += 1
            }
            i += 1
        }
        return islandCount
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
    
    @objc func testC() {
        let solution = Solution()
        let s = """
                """
        let input = getChars(s)
        let expectedOutput = 0
        let actualOutput = solution.numIslands(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let s = """
                111
                010
                111
                """
        let input = getChars(s)
        let expectedOutput = 1
        let actualOutput = solution.numIslands(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
