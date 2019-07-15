import Cocoa

/*
 给定一个二叉树，找出其最小深度。
 
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 给定二叉树 [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 返回它的最小深度  2.
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        guard root.left != nil || root.right != nil else{
            return 1
        }
        var result = Int.max
        if let left = root.left {
            result = min(minDepth(left),result)
        }
        if let right = root.right {
            result = min(minDepth(right),result)
        }
        return result + 1
    }
}

Solution().minDepth(root)
