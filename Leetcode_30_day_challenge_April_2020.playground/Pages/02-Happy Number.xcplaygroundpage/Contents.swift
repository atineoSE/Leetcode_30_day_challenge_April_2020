/*:
 [Day 2: 02/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3284/)
 
 # Happy Number
 
 Write an algorithm to determine if a number is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

 Example:
-------------
 Input: 19
 
 Output: true
 
 Explanation:
 * 1^2 + 9^2 = 82
 * 8^2 + 2^2 = 68
 * 6^2 + 8^2 = 100
 * 1^2 + 0^2 + 0^2 = 1
 
 */

/*:
 Note that the cycle can be within a section of the calculated values, for instance:
 77 -> 98 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89 -> back to 145...
 */

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        //return isHappyOO(n)
        return isHappyProcedural(n)
    }
    
    func isHappyOO(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        
        let generator = HappyNumberGenerator(initialValue: n)
        var number: Int? = n
        while number != nil {
            number = generator.nextUniqueNumber()
            //print(number ?? "nil")
        }
        return generator.isHappy
    }
    
    func isHappyProcedural(_ n: Int) -> Bool {
        precondition(n >= 0)
        
        var value = n
        //print(value)
        var computedValues: Set<Int> = []
        
        while (value != 1 && !computedValues.contains(value)) {
            computedValues.insert(value)
            value = value.sumfOfDigitsSquared
            //print(value)
        }

        return value == 1
    }
}

class HappyNumberGenerator {
    private var computedValues: Set<Int>
    private var currentValue: Int
    
    init(initialValue: Int) {
        currentValue = initialValue
        computedValues = []
    }
    
    func nextUniqueNumber() -> Int? {
        currentValue = currentValue.sumfOfDigitsSquared
        if computedValues.contains(currentValue) {
            return nil
        } else {
            computedValues.insert(currentValue)
            return currentValue
        }
    }
    
    var isHappy: Bool {
        return computedValues.contains(1)
    }
}

extension Int {
    var sumfOfDigitsSquared: Int {
        let numberAsString = String(self)
        var result = 0
        for char in numberAsString {
            result += Int(pow(Float(String(char))!,2))
        }
        return result
    }
}

class TestCase: XCTestCase {
    
    @objc func testIntExtension() {
        let input = 19
        let actualOutput = input.sumfOfDigitsSquared
        let expectedOutput = 82
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testA() {
        let solution = Solution()
        let input = 19
        let expectedOutput = true
        let actualOutput = solution.isHappy(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = 1
        let expectedOutput = true
        let actualOutput = solution.isHappy(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = 100
        let expectedOutput = true
        let actualOutput = solution.isHappy(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let input = 77
        let expectedOutput = false
        let actualOutput = solution.isHappy(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

