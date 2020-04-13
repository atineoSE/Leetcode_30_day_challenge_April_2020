/*:
[Day 12: 12/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3293/)

 # Last Stone Weight

 We have a collection of stones, each stone has a positive integer weight.

 Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:

 If x == y, both stones are totally destroyed;
 If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.
 At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)

 Example 1:
----------
 Input: [2,7,4,1,8,1]
 Output: 1
 Explanation:
 We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
 we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
 we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
 we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
  

 Note:
------

 1 <= stones.length <= 30
 1 <= stones[i] <= 1000
 */

import Foundation

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        assert(stones.count > 0)
        var sortedStones = stones.sorted()
        myPrint(sortedStones)
        while sortedStones.count > 1 {
            let last = sortedStones.removeLast()
            let secondToLast = sortedStones.removeLast()
            if last > secondToLast {
                let newElem = last-secondToLast
                if let idx = sortedStones.firstIndex(where: { $0 > newElem}) {
                    sortedStones.insert(newElem, at: idx)
                } else {
                    sortedStones.append(newElem)
                }
            }
            myPrint(sortedStones)
        }
        return sortedStones.count == 0 ? 0 : sortedStones[0]
    }
}

class TestCase: XCTestCase {
    
    @objc func testA() {
        let solution = Solution()
        let expectedOutput = 1
        let actualOutput = solution.lastStoneWeight([2,7,4,1,8,1])
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testB() {
        let solution = Solution()
        let expectedOutput = 2
        let actualOutput = solution.lastStoneWeight([3,1])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let expectedOutput = 5
        let actualOutput = solution.lastStoneWeight([5])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let expectedOutput = 0
        let actualOutput = solution.lastStoneWeight([5,5])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testE() {
        let solution = Solution()
        let expectedOutput = 0
        let actualOutput = solution.lastStoneWeight([1,1,2,2,5,7])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testF() {
        let solution = Solution()
        let expectedOutput = 1
        let actualOutput = solution.lastStoneWeight([1,1,2,2,5,7,17])
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    @objc func testG() {
        let solution = Solution()
        let expectedOutput = 2
        let actualOutput = solution.lastStoneWeight([3,7,8])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testH() {
        let solution = Solution()
        let expectedOutput = 1
        let actualOutput = solution.lastStoneWeight([1,2,4,4])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testI() {
        let solution = Solution()
        let expectedOutput = 1
        let actualOutput = solution.lastStoneWeight([434,667,378,919,212,902,240,257,208,996,411,222,557,634,425,949,755,833,785,886,40,159,932,157,764,916,85,300,130,278])
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

