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
        if root?.left == nil && root?.right == nil{
            return true
        }
        
        guard let left = root?.left, let right = root?.right else {
            return false
        }
        
        var rightA = right
        reverse(&rightA)
        
        return isSameTree(left, rightA)
    }
    
    func reverse(_ root: inout TreeNode){
        if root.left == nil && root.right == nil {
            return
        }
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        if root.left != nil {
            reverse(&root.left!)
        }
        
        if root.right != nil {
            reverse(&root.right!)
        }
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }
        
        guard isSameTree(p.left, q.left) && isSameTree(p.right, q.right) else {
            return false
        }
        
        return true
    }
}

Solution().isSymmetric(p)
