/*:
[Day 11: 11/04/2020](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3293/)

 # Diameter of binary tree
 
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

func myPrint(_ arg: Any) {
    //print(arg)
}

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

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        if lhs.val == rhs.val && lhs.left == nil && rhs.left == nil && lhs.right == nil && rhs.right == nil {
            return true
        } else {
            return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
        }
    }
}

class Solution {
    var maxDiameter = 0
    
    // post-order traversal
    func getDepth(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let leftDepth = getDepth(node.left)
        let rightDepth = getDepth(node.right)
 
        let diameter = leftDepth + rightDepth
        //print("diameter \(node.val): \(diameter)")
        if diameter > maxDiameter {
            maxDiameter = diameter
        }
        
        return 1 + max(leftDepth, rightDepth)
    }
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = getDepth(root)
        
        return  maxDiameter
    }
}

// MARK: Helpers
// The tree in this problem takes nil as valid insertion value, where it defines a point beyond which no new nodes can be inserted.
// This solution creates the tree in an intermediate format where each side (left or right)
// can take either a node with a value, nil is there is nothing but it is ready to receive a value and
// skip when it's nil but it cannot take a value.
class TreeNode2 {
    enum TreeNodeOption {
        case treeNode(TreeNode2)
        case null
        case skip
    }
    
    var val: Int
    var left: TreeNodeOption
    var right: TreeNodeOption
    init(_ val: Int) {
        self.val = val
        self.left = .null
        self.right = .null
    }
}

func convert(_ nodeOption: TreeNode2.TreeNodeOption) -> TreeNode? {
    switch nodeOption {
    case .treeNode(let nodeToCopy):
        let newNode = TreeNode(nodeToCopy.val)
        newNode.left = convert(nodeToCopy.left)
        newNode.right = convert(nodeToCopy.right)
        return newNode
    case .null:
        return nil
    case .skip:
        return nil
    }
}


func serializeBF(root: TreeNode?) -> [Int?] {
    guard let root = root else { return [] }
    
    var serialization:[Int?] = []
    var queue: [TreeNode?] = [root]
    
    while !queue.isEmpty {
        guard let currentNode = queue.removeFirst() else {
            serialization.append(nil)
            continue
        }
        serialization.append(currentNode.val)
        queue.append(currentNode.left)
        queue.append(currentNode.right)
    }
    
    let lastIndex = serialization.lastIndex { $0 != nil } ?? serialization.count - 1
    return Array(serialization[0...lastIndex])
}

func createTreeBF(_ arr: [Int?]) -> TreeNode? {
    guard let first = arr.first else { return nil }
    
    let root = first != nil ? TreeNode2(first!) : nil
    
    if let root = root {
        for val in arr[1...] {
            insertBF(val: val, root: root)
        }
        return convert(TreeNode2.TreeNodeOption.treeNode(root))
    } else {
        return nil
    }
}

func insertBF(val: Int?, root: TreeNode2) {
    let newNode = val != nil ? TreeNode2.TreeNodeOption.treeNode(TreeNode2(val!)) : TreeNode2.TreeNodeOption.skip
    var queue: [TreeNode2] = []
    var currentNode = root
    while true {
        myPrint("")
        myPrint("currentNode = \(currentNode.val), looking to insert \(val != nil ? String(val!) : "nil")")
        let serializedQueue = "[" + queue.map { String($0.val) }.joined(separator: ",") + "]"
        myPrint("q: \(serializedQueue)")
        myPrint("tree: \(serializeBF(root: convert(TreeNode2.TreeNodeOption.treeNode(root))))")
        
        let left = currentNode.left
        let right = currentNode.right
        
        if case .treeNode(let node) = left {
            queue.append(node)
            if case .treeNode(let node) = right {
                queue.append(node)
            } else if case .skip = right {
                // skip
            } else if case .null = right {
                // insert to the right
                myPrint("insert right")
                currentNode.right = newNode
                break   // ignore rest of queue, we already inserted
            }
        } else if case .skip = left {
            // skip left, try right
            if case .treeNode(let node) = right {
                queue.append(node)
            } else if case .skip = right {
                // skip
            } else if case .null = right {
                // insert to the right
                myPrint("insert right")
                currentNode.right = newNode
                break   // ignore rest of queue, we already inserted
            }
        } else if case .null = left {
            // insert to the left
            myPrint("insert left")
            currentNode.left = newNode
            break   // ignore rest of queue, we already inserted
        }

        currentNode = queue.removeFirst()
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
    
    @objc func testTreeCreationA() {
        let actualRoot = createTreeBF([1,2,3,4,5])
        
        let expectedRoot = TreeNode(1)
        expectedRoot.left = TreeNode(2)
        expectedRoot.right = TreeNode(3)
        expectedRoot.left!.left = TreeNode(4)
        expectedRoot.left!.right = TreeNode(5)
        
        XCTAssertEqual(actualRoot, expectedRoot)
    }
    
    @objc func testTreeCreationB() {
        let actualRoot = createTreeBF([1,2,nil,3,nil,4,5])
        
        let expectedRoot = TreeNode(1)
        expectedRoot.left = TreeNode(2)
        expectedRoot.left!.left = TreeNode(3)
        expectedRoot.left!.left!.left = TreeNode(4)
        expectedRoot.left!.left!.right = TreeNode(5)
        
        XCTAssertEqual(actualRoot, expectedRoot)
    }

    
    @objc func testTreeCreationC() {
        let actualRoot = createTreeBF([1,2,3,nil,4,nil,5])
        
        let expectedRoot = TreeNode(1)
        expectedRoot.left = TreeNode(2)
        expectedRoot.right = TreeNode(3)
        expectedRoot.left!.right = TreeNode(4)
        expectedRoot.right!.right = TreeNode(5)
        
        XCTAssertEqual(actualRoot, expectedRoot)
    }

    @objc func testTreeCreationD() {
        let actualRoot = createTreeBF([4,-7,-3,nil,nil,-9,-3,9,-7,-4])
        
        let expectedRoot = TreeNode(4)
        expectedRoot.left = TreeNode(-7)
        expectedRoot.right = TreeNode(-3)
        expectedRoot.right!.left = TreeNode(-9)
        expectedRoot.right!.right = TreeNode(-3)
        expectedRoot.right!.left!.left = TreeNode(9)
        expectedRoot.right!.left!.right = TreeNode(-7)
        expectedRoot.right!.right!.left = TreeNode(-4)
        
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
    
    @objc func testB() {
        let solution = Solution()
        let input = [4,-7,-3,nil,nil,-9,-3,9,-7,-4,nil,6,nil,-6,-6,nil,nil,0,6,5,nil,9,nil,nil,-1,-4,nil,nil,nil,-2]
        let root = createTreeBF(input)
        let expectedOutput = 8
        let actualOutput = solution.diameterOfBinaryTree(root)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}

TestCase()
