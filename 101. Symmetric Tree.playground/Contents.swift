import Cocoa

/*
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
   1
  / \
  2   2
   \   \
    3    3
 说明:
 
 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
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

let p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(3)

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isSameTree(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
            if A == nil && B == nil {
                return true
            }
            
            if A == nil || B == nil {
                return false
            }
            
            if A?.val != B?.val {
                return false
            }
            
            return isSameTree(A?.left, B?.right) && isSameTree(A?.right, B?.left)
        }
        return isSameTree(root, root)
    }
}

Solution().isSymmetric(p)
