/*:
[Day 7: 07/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3289/)

 # Counting Elements
 
Given an integer array arr, count element x such that x + 1 is also in arr.

If there're duplicates in arr, count them seperately.

 
Example 1:
---------
Input: arr = [1,2,3]
Output: 2
Explanation: 1 and 2 are counted cause 2 and 3 are in arr.
 
Example 2:
----------
Input: arr = [1,1,3,3,5,5,7,7]
Output: 0
Explanation: No numbers are counted, cause there's no 2, 4, 6, or 8 in arr.
 
Example 3:
---------
Input: arr = [1,3,2,3,5,0]
Output: 3
Explanation: 0, 1 and 2 are counted cause 1, 2 and 3 are in arr.
 
Example 4:
----------
Input: arr = [1,1,2,2]
Output: 2
Explanation: Two 1s are counted cause 2 is in arr.

Constraints:
----------
1 <= arr.length <= 1000
0 <= arr[i] <= 1000
 */

import Foundation

class Solution {
    // Time: O(n^2) in worst-case, but expected case is O(nlogn), given we sort the array,
    // thus the lookup for the first matching index won't be generally O(n)
    // Space: O(N)
    func countElements(_ arr: [Int]) -> Int {
        assert(arr.count > 0)
        let sortedArr = arr.sorted()

        var i = 0
        var count = 0
        let elemCount = sortedArr.count
        while i < elemCount-1 {
            let cur = sortedArr[i]
            if let _ = sortedArr[(i+1)..<elemCount].firstIndex(where: { $0 == cur + 1 }) {
                count += 1
            }
            i += 1
        }
        return count
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [1,2,3]
        let expectedOutput = 2
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testB() {
        let solution = Solution()
        let input = [1,1,3,3,5,5,7,7]
        let expectedOutput = 0
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testC() {
        let solution = Solution()
        let input = [1,3,2,3,5,0]
        let expectedOutput = 3
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testD() {
        let solution = Solution()
        let input = [1,1,2,2]
        let expectedOutput = 2
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testE() {
        let solution = Solution()
        let input = [1,1,2,3]
        let expectedOutput = 3
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let input = [1,1,2]
        let expectedOutput = 2
        let actualOutput = solution.countElements(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
