/*:
 [Day 13: 13/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3298/)
 
 # Contiguous Array
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 Example 1:
 -----------
 Input: [0,1]
 
 Output: 2
 
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 
 Example 2:
 -------------
 Input: [0,1,0]
 
 Output: 2
 
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 
 Note: The length of the given binary array will not exceed 50,000.
 */

import Foundation

struct LazyRangeGenerator {
    private let low: Int
    private let high: Int
    
    private var currentLow: Int
    private var currentHigh: Int
    
    var length: Int? {
        didSet {
            currentLow = low
            currentHigh = high
        }
    }
    
    init(low: Int, high: Int) {
        self.low = low
        self.high = high
        currentLow = low
        currentHigh = high
    }
    
    mutating func next() -> ClosedRange<Int>? {
        guard let length = length else { return nil }
        guard currentLow+length-1 <= high else { return nil }
        defer {
            currentLow += 1
        }
        return currentLow...currentLow+length-1
    }
}

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    
    func qualifies(_ nums: ArraySlice<Int>) -> Bool {
        return nums.reduce(0, +) == nums.count/2
    }
    
    // Time: O(n^3): generates all subarrays O(n^2) and reduces each O(n)
    // Space: O(1)
    func findMaxLengthOO(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var lazyRangeGenerator = LazyRangeGenerator(low: 0, high: nums.count-1)
        var currentLength = nums.count  // begin with largest lenght so as to exit early
        while currentLength > 1 {
            guard currentLength % 2 == 0 else {
                currentLength -= 1
                continue
            }
            lazyRangeGenerator.length = currentLength
            while let range = lazyRangeGenerator.next() {
                let subarray = nums[range]
                if qualifies(subarray) {
                    return subarray.count   // early exit (doesn't help with asymptotic complexity though
                }
            }
            currentLength -= 1
        }

        return 0
    }
    
    
    // Time: O(n)
    // Space: O(n^3)
    // Key insight: graph of adding up or substracting numbers, then keeping indices for same sum
    // which indicates the length of the subarray
    // Also initializing the dict to contain the first entry and updating the index before registering
    func findMaxLengthWithDict(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var sumToIndicesDict: [Int: (Int, Int?)] = [0:(0,nil)]
        
        func register(sum: Int, newIndex: Int) {
            if let (i, _) = sumToIndicesDict[sum] {
                sumToIndicesDict[sum] = (i, newIndex)
            } else {
                sumToIndicesDict[sum] = (newIndex, nil)
            }
        }
        
        func getLength(indices: (Int,Int?)) -> Int? {
            if let j = indices.1 {
                return j - indices.0
            } else {
                return nil
            }
        }
        
        var i = 0
        var sum = 0
        while i < nums.count {
            myPrint(sumToIndicesDict)
            sum  = nums[i] == 0 ? sum - 1 : sum + 1
            i += 1
            register(sum: sum, newIndex: i)
        }
        
        myPrint(sumToIndicesDict)
        
        // Only qualifying substrings, i.e. they have a second index
        let lengths = sumToIndicesDict.values.compactMap { indices in
            return getLength(indices: indices)
        }

        return lengths.max() ?? 0
    }
    
    func findMaxLength(_ nums: [Int]) -> Int {
        return findMaxLengthWithDict(nums)
        //return findMaxLengthOO(nums)
    }
}


class TestCase: XCTestCase {

    @objc func testDoesNotQualifyA() {
        let solution = Solution()
        let input = [0,0]
        let expectedOutput = false
        let actualOutput = solution.qualifies(input[0...])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testDoesNotQualifyB() {
        let solution = Solution()
        let input = [0,0,0,1]
        let expectedOutput = false
        let actualOutput = solution.qualifies(input[0...])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testQualifiesA() {
        let solution = Solution()
        let input = [0,1]
        let expectedOutput = true
        let actualOutput = solution.qualifies(input[0...])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testQualifiesB() {
        let solution = Solution()
        let input = [1,0,0,1]
        let expectedOutput = true
        let actualOutput = solution.qualifies(input[0...])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testLazyRangeGeneratorA() {
        var generator = LazyRangeGenerator(low: 0, high: 6)
        generator.length = 4
        var actualRanges: [ClosedRange<Int>] = []
        while let range = generator.next() {
            actualRanges.append(range)
        }

        let expectedRanges = [0...3, 1...4, 2...5, 3...6]
        XCTAssertEqual(actualRanges, expectedRanges)
    }
    
    @objc func testA() {
        let solution = Solution()
        let input = [0,1]
        let expectedOutput = 2
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = [0,1,0]
        let expectedOutput = 2
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = [0]
        let expectedOutput = 0
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let input = [0,0]
        let expectedOutput = 0
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testE() {
        let solution = Solution()
        let input = [0,1,1,1,1,0,0,0]
        let expectedOutput = 8
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let input = [0,1,1,1,1,0,0]
        let expectedOutput = 4
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testG() {
        let solution = Solution()
        let input = [1,1,1,1,0,0,0]
        let expectedOutput = 6
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    
    @objc func testH() {
        let solution = Solution()
        let input = [1,0,1,1,0,0,0]
        let expectedOutput = 6
        let actualOutput = solution.findMaxLength(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
