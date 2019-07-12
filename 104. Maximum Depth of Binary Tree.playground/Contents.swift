import Cocoa

/*
 给定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
   3
  / \
 9  20
   /  \
  15   7
 返回它的最大深度 3 。
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

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

Solution().maxDepth(root)
