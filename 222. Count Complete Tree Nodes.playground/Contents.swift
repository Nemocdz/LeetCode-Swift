import Cocoa

/*
Given a complete binary tree, count the number of nodes.

Note:

Definition of a complete binary tree from Wikipedia:
In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

Example:

Input:
    1
   / \
  2   3
 / \  /
4  5 6

Output: 6
 */

/**
 * Definition for a binary tree node.
 */
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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var leftHeight = 0
        var rightHeight = 0
        var leftNode:TreeNode? = root
        var rightNode:TreeNode? = root
        while let node = leftNode {
            leftNode = node.left
            leftHeight += 1
        }
        
        while let node = rightNode {
            rightNode = node.right
            rightHeight += 1
        }
        
        if leftHeight == rightHeight {
            return (2 << (leftHeight - 1)) - 1
        } else {
            return 1 + countNodes(root.left) + countNodes(root.right)
        }
    }
}
