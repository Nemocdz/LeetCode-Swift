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

let root = TreeNode(5)
root.left = TreeNode(4)
let sum = 9
 
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.left == nil && root.right == nil && root.val == sum {
            return true
        }
        
        let remain = sum - root.val
        
        return hasPathSum(root.left, remain) || hasPathSum(root.right, remain)
    }
}

Solution().hasPathSum(root, sum)
