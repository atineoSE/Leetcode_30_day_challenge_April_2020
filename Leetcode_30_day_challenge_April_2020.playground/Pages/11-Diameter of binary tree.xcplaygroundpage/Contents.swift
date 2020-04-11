/*:
[Day 11: 11/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3293/)

 # Min Stack
 
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 Example:
 Given a binary tree

           1
          / \
         2   3
        / \
       4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

 Note: The length of path between two nodes is represented by the number of edges between them.
 
 */

import Foundation

// Definition for a binary tree node (provided by problem)
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        return 0
    }
}

// MARK: Helpers
func serializeBF(root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var serialization:[Int] = []
    var queue = [root]
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        serialization.append(currentNode.val)
        
        if let left = currentNode.left {
            queue.append(left)
        }
        
        if let right = currentNode.right {
            queue.append(right)
        }
    }
    
    return serialization
}

func createTreeBF(_ arr: [Int]) -> TreeNode? {
    guard let first = arr.first else { return nil }
    
    let root = TreeNode(first)
    for val in arr[1...] {
        insertBF(val: val, root: root)
    }
    
    return root
}

func insertBF(val: Int, root: TreeNode) {
    var queue = [root]
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        if let left = currentNode.left {
            queue.append(left)
        } else {
            currentNode.left = TreeNode(val)
            break
        }

        if let right = currentNode.right {
            queue.append(right)
        } else {
            currentNode.right = TreeNode(val)
            break
        }
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        if lhs.val == rhs.val && lhs.left == nil && rhs.left == nil && lhs.right == nil && rhs.right == nil {
            return true
        } else {
            return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
        }
    }
}

// MARK: Tests
class TestCase: XCTestCase {
    
    @objc func testTreeEqualityForEqual() {
        let root1 = TreeNode(1)
        root1.left = TreeNode(2)
        root1.right = TreeNode(3)
        
        let root2 = TreeNode(1)
        root2.left = TreeNode(2)
        root2.right = TreeNode(3)
        
        XCTAssertEqual(root1, root2)
    }
    
    @objc func testTreeEqualityForNotEqual() {
        let root1 = TreeNode(1)
        root1.left = TreeNode(2)
        root1.right = TreeNode(3)
        
        let root2 = TreeNode(1)
        root2.left = TreeNode(2)
        root2.right = TreeNode(2)
        
        XCTAssertNotEqual(root1, root2)
    }
    
    @objc func testTreeCreation() {
        let actualRoot = createTreeBF([1,2,3,4,5])
        
        let expectedRoot = TreeNode(1)
        expectedRoot.left = TreeNode(2)
        expectedRoot.right = TreeNode(3)
        expectedRoot.left!.left = TreeNode(4)
        expectedRoot.left!.right = TreeNode(5)
        
        XCTAssertEqual(actualRoot, expectedRoot)
    }
    
    @objc func testTreeSerialization() {
        let root = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left!.left = TreeNode(4)
        root.left!.right = TreeNode(5)
        
        let expectedOutput = [1,2,3,4,5]
        let actualOutput = serializeBF(root: root)
        
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    
    @objc func testA() {
        let solution = Solution()
        let input = createTreeBF([1,2,3,4,5])
        let expectedOutput = 3
        let actualOutput = solution.diameterOfBinaryTree(input)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}
TestCase()
