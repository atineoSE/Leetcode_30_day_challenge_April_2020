/*:
[Day 8: 08/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3290/)

 # Counting Elements
 
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.

 If there are two middle nodes, return the second middle node.

 Example 1:
----------
 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 
 Example 2:
-----------
 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 Note:
-----
 The number of nodes in the given list will be between 1 and 100.
 */

import Foundation

/**
 * Definition for singly-linked list. (provided by exercise)
 * */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        return nil
    }
}

class TestCase: XCTestCase {
    
    private func getList(from array: [Int]) -> ListNode? {
        var head: ListNode? = nil
        var lastNode: ListNode? = nil
        for elem in array {
            let newNode = ListNode(elem)
            if lastNode == nil {
                head = newNode
            } else {
                lastNode!.next = newNode
            }
            lastNode = newNode
        }
        return head
    }
    
    private func getSerialization(from list: ListNode?) -> [Int] {
        var currentNode = list
        var serialization: [Int] = []
        while currentNode != nil {
            serialization.append(currentNode!.val)
            currentNode = currentNode!.next
        }
        return serialization
    }
    
    @objc func testA() {
        let solution = Solution()
        let input = getList(from: [1,2,3,4,5])
        let expectedOutput = [3,4,5]
        let actualOutput = solution.middleNode(input)
        XCTAssertEqual(getSerialization(from: actualOutput), expectedOutput)
    }
    
    @objc func testB() {
        let solution = Solution()
        let input = getList(from: [1,2,3,4,5,6])
        let expectedOutput = [4,5,6]
        let actualOutput = solution.middleNode(input)
        XCTAssertEqual(getSerialization(from: actualOutput), expectedOutput)
    }
}

TestCase()
