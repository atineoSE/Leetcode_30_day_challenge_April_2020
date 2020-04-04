/*:
 [Day 4: 04/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3286/)
 
 
 # Move Zeroes
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */


import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        _ = nums.halfStablePartition(isSuffixElement: { $0 == 0})
        return
    }
}

extension MutableCollection {
    /// Moves all elements satisfying `isSuffixElement` into a suffix of the collection,
    /// returning the start position of the resulting suffix.
    ///
    /// - Complexity: O(n) where n is the number of elements.
    mutating func halfStablePartition(isSuffixElement: (Element) -> Bool) -> Index {
        guard var i = firstIndex(where: isSuffixElement) else { return endIndex }
        var j = index(after: i)
        while j != endIndex {
            if !isSuffixElement(self[j]) {
                swapAt(i, j)
                formIndex(after: &i)
            }
            formIndex(after: &j)
        }
        return i
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        var input = [0,1,0,3,12]
        let expectedOutput = [1,3,12,0,0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        var input = [0]
        let expectedOutput = [0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        var input = [1,3,12,0,0]
        let expectedOutput = [1,3,12,0,0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        var input = [0,-1,5,3,0]
        let expectedOutput = [-1,5,3,0,0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, expectedOutput)
    }

}

TestCase()
