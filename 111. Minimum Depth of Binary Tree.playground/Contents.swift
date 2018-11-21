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
