import Cocoa

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
        
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }
        
        guard isSameTree(p.left, q.left) && isSameTree(p.right, q.right) else {
            return false
        }
        
        return true
    }
}

Solution().isSameTree(p, q)
