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
 
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        inorderTraversal(root, &result)
        return result
    }
    
    func inorderTraversal(_ root:TreeNode?, _ nodes:inout [Int]){
        guard let root = root else { return }
        if root.left == nil && root.right == nil {
            nodes.append(root.val)
            return
        }
        if let left = root.left {
            inorderTraversal(left, &nodes)
        }
        
        nodes.append(root.val)
        
        if let right = root.right {
            inorderTraversal(right, &nodes)
        }
    }
}
