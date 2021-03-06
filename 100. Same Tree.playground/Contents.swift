import Cocoa

/*
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1:
 
 输入:       1         1
           / \       / \
          2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 示例 2:
 
 输入:      1          1
           /           \
          2             2
 
 [1,2],     [1,null,2]
 
 输出: false
 示例 3:
 
 输入:       1         1
           / \       / \
          2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 输出: false
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

let q = TreeNode(1)
q.left = TreeNode(2)
q.right = TreeNode(3)

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p?.val != q?.val {
            return false
        }
        
        if isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right) {
            return true
        }
        
        return false
    }
}

Solution().isSameTree(p, q)
