import Cocoa

/*
 给定一个二叉树，判断它是否是高度平衡的二叉树。
 
 本题中，一棵高度平衡二叉树定义为：
 
 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 
 示例 1:
 
 给定二叉树 [3,9,20,null,null,15,7]
 
   3
  / \
 9  20
   /  \
  15   7
 返回 true 。
 
 示例 2:
 
 给定二叉树 [1,2,2,3,3,null,null,4,4]
 
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 返回 false 。
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func balancedDepth(_ root: TreeNode?) -> Int? {
            if root == nil {
                return 0
            }
            
            if let leftDepth = balancedDepth(root?.left), let rightDepth = balancedDepth(root?.right), abs(leftDepth - rightDepth) <= 1 {
                return 1 + max(leftDepth, rightDepth)
            }
            
            return nil
        }
        
        return balancedDepth(root) != nil
    }
}

Solution().isBalanced(root)


