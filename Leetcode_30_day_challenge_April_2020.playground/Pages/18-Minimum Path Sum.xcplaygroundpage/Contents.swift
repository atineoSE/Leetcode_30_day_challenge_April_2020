/*:
[Day 18: 18/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3303/)

# Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:
----------
 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 */

import Foundation

class Solution {
    var m = 0
    var n = 0
    
    // MARK: traverse forward (explores all possible paths)
    func traverseForward(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int? {
        guard i < n && i >= 0 else { return nil }
        guard j < m && j >= 0 else { return nil }
        
        let down = traverseForward(grid, i+1, j)
        let right = traverseForward(grid, i, j+1)
        
        var output = 0
        
        if let right = right, let down = down {
            output += Swift.min (right, down)
        } else if let right = right {
            output += right
        } else if let down = down {
            output += down
        }
        
        return output + grid[i][j]
    }
    
    func minPathSumForward(_ grid: [[Int]]) -> Int {
        return traverseForward(grid,0,0)!
    }
    
    // MARK: traverse backward (prune if current path is already greater than best currently found solution)
    var min = Int.max

    func peek(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int? {
        guard i < n && i >= 0 else { return nil }
        guard j < m && j >= 0 else { return nil }
        
        return grid[i][j]
    }
    
    func traverseBackward(_ grid: [[Int]], _ i: Int, _ j: Int, _ accumulatedSum: Int) {
        guard i < n && i >= 0 else { return }
        guard j < m && j >= 0 else { return }
        
        let currentMin = accumulatedSum + grid[i][j]
        
        guard i != 0 || j != 0 else {
            if currentMin < min {
                min = currentMin                // current best solution
            }
            return
        }
        
        guard currentMin < min else { return }  // prune in case currentMin bigger than one found solution
        
        // apply heuristic to greedily go for the lower number of the two options
        let up = peek(grid, i-1, j)
        let left = peek(grid, i, j-1)
        
        if let up = up, let left = left {
            if up < left {
                traverseBackward(grid, i-1, j, currentMin)
                traverseBackward(grid, i, j-1, currentMin)
            } else {
                traverseBackward(grid, i, j-1, currentMin)
                traverseBackward(grid, i-1, j, currentMin)
            }
        } else if let _ = up {
            traverseBackward(grid, i-1, j, currentMin)
        } else {
            traverseBackward(grid, i, j-1, currentMin)
        }
    }
    
    // N+M-1 ops for an end-to-end traversal
    // total number of possible traversals is proportional to N*M
    // Time: O(N^2*M^2) (?)
    func minPathSumBackward(_ grid: [[Int]]) -> Int {
        traverseBackward(grid, n-1, m-1, 0)
        return min
    }
    
    // Time: O(N*M)
    // Space: O(N*M)
    func minPathSumDynamicProgramming(_ grid: [[Int]]) -> Int {
        func getDp(_ i: Int, _ j: Int) -> Int? {
            guard i >= 0 else { return nil }
            guard j >= 0 else { return nil }
            return dp[i][j]
        }

        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
        var i = 0
        while i < n {
            var j = 0
            while j < m {
                let left = getDp(i, j-1)
                let up = getDp(i-1, j)
                
                if let left = left, let up = up {
                    dp[i][j] = Swift.min(left, up) + grid[i][j]
                } else if let left = left {
                    dp[i][j] = left + grid[i][j]
                } else if let up = up {
                    dp[i][j] = up + grid[i][j]
                } else {
                    dp[i][j] = grid[i][j]
                }
                
                j += 1
            }
            i += 1
        }
        
        return dp[n-1][m-1]
    }
    
    // MARK: main
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        n = grid.count
        guard n > 0 else { return 0 }
        m = grid[0].count
        
        //return minPathSumForward(grid)
        //return minPathSumBackward(grid)
        return minPathSumDynamicProgramming(grid)
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [[1,3,1],[1,5,1],[4,2,1]]
        let expectedOutput = 7
        let actualOutput = solution.minPathSum(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input:[[Int]] = []
        let expectedOutput = 0
        let actualOutput = solution.minPathSum(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input:[[Int]] = [[1,2],[1,1]]
        let expectedOutput = 3
        let actualOutput = solution.minPathSum(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    // Performance test
//    @objc func testC() {
//        let solution = Solution()
//        let input:[[Int]] =     [[8,1,9,5,0,0,4,8,0,5,1,7,3,2,2],
//                                 [9,5,9,8,3,5,3,6,2,0,7,1,6,0,2],
//                                 [3,8,4,3,5,6,5,9,4,7,7,7,4,2,1],
//                                 [9,1,8,8,9,1,5,2,0,7,3,7,1,1,7],
//                                 [3,5,8,9,0,5,5,7,5,1,4,4,8,9,8],
//                                 [1,0,9,9,8,0,1,4,2,1,3,7,8,4,1],
//                                 [8,0,6,8,1,6,3,9,5,0,0,9,6,1,0],
//                                 [4,2,0,3,2,1,5,5,7,0,8,0,9,8,7],
//                                 [0,8,9,6,6,0,4,2,9,9,2,0,1,1,3],
//                                 [1,5,7,4,1,1,5,6,6,4,6,6,4,6,5],
//                                 [3,6,3,2,5,2,3,9,4,2,1,8,4,2,9],
//                                 [9,5,5,7,9,8,0,6,4,9,0,3,5,7,9],
//                                 [0,0,7,6,3,2,8,8,4,4,2,5,4,9,9],
//                                 [4,8,4,1,7,6,9,8,4,3,7,5,8,4,4],
//                                 [7,5,4,7,3,9,9,3,9,3,9,2,0,3,1],
//                                 [9,7,1,6,0,9,2,9,9,6,5,8,3,3,2],
//                                 [7,3,9,4,0,2,5,1,7,5,7,6,9,7,0],
//                                 [2,7,9,3,3,0,4,7,1,5,3,8,3,9,4],
//                                 [6,6,7,7,2,9,0,8,0,9,5,7,6,4,7]]
//        let expectedOutput = 0  // TBD
//        let actualOutput = solution.minPathSum(input)
//        XCTAssertEqual(actualOutput, expectedOutput)
//    }
}

TestCase()
