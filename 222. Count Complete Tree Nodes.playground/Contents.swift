import Cocoa

/*
 给出一个完全二叉树，求出该树的节点个数。
 
 说明：
 
 完全二叉树的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。
 
 示例:
 
 输入:
     1
    / \
   2   3
  / \  /
 4  5 6
 
 输出: 6
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
