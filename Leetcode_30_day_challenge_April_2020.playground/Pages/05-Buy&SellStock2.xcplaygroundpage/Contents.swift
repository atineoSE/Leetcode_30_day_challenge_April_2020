/*:
[Day 5: 05/04/2020](https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3287/)

# Best Time to Buy and Sell Stock II

Say you have an array for which the `ith` element is the price of a given stock on day `i`.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

Example 1:
-----------
Input: [7,1,5,3,6,4]
 
Output: 7
 
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 
Example 2:
-----------
Input: [1,2,3,4,5]
 
Output: 4
 
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
             engaging multiple transactions at the same time. You must sell before buying again.
 
Example 3:
-----------
Input: [7,6,4,3,1]
 
Output: 0
 
Explanation: In this case, no transaction is done, i.e. max profit = 0.

*/

import Foundation

func myPrint(_ arg: Any) {
    //print(arg)
}

class Solution {
    func priceGoesDown(currentPrice: Int, lastPrice: Int) -> Bool {
        return currentPrice < lastPrice
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        
        var i = 0
        var profit = 0
        var isLookingToBuy = true
        var buyingPrice = 0
        var lastPrice = -1
        
        while i < prices.count {
            let currentPrice = prices[i]
            myPrint("i: \(i), currentPrice: \(currentPrice), lastPrice: \(lastPrice), isLookingToBuy: \(isLookingToBuy), buyingPrice:\(buyingPrice)")
            
            guard lastPrice != -1 else {
                lastPrice = prices[i]
                i += 1
                continue
            }
            
            if priceGoesDown(currentPrice: currentPrice, lastPrice: lastPrice) {
                if isLookingToBuy {
                    // buy on current day
                    myPrint("buy at \(currentPrice)")
                    buyingPrice = currentPrice
                    isLookingToBuy = false
                } else {
                    // sell on last day
                    myPrint("sell at \(lastPrice) with profit \(lastPrice - buyingPrice)")
                    profit += lastPrice - buyingPrice
                    buyingPrice = 0
                    isLookingToBuy = true
                    i -= 1 // reevaluate current day
                }
            } else {
                if isLookingToBuy {
                    // buy on last day
                    myPrint("buy at \(lastPrice)")
                    buyingPrice = lastPrice
                    isLookingToBuy = false
                    i -= 1 // reevaluate current day
                } else if i == prices.count - 1 && buyingPrice < currentPrice {
                    // sell on current day if there are no more days registered
                    myPrint("sell at \(currentPrice) with profit \(currentPrice - buyingPrice)")
                    profit += currentPrice - buyingPrice
                    buyingPrice = 0
                    isLookingToBuy = true
                }
            }

            lastPrice = currentPrice
            i += 1
        }
        
        return profit
    }
}

class TestCase: XCTestCase {
    @objc func testA() {
        let solution = Solution()
        let input = [7,1,5,3,6,4]
        let expectedOutput = 7
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB1() {
        let solution = Solution()
        let input = [1,2,3,4,5]
        let expectedOutput = 4
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testB2() {
        let solution = Solution()
        let input = [1,2,3,4,5,3]
        let expectedOutput = 4
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testC() {
        let solution = Solution()
        let input = [7,6,4,3,1]
        let expectedOutput = 0
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testD() {
        let solution = Solution()
        let input:[Int] = []
        let expectedOutput = 0
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    @objc func testE() {
        let solution = Solution()
        let input:[Int] = [1,2]
        let expectedOutput = 1
        let actualOutput = solution.maxProfit(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()

