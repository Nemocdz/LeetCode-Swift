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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        func _isValidBST(_ root: TreeNode, _ min:Int?, _ max:Int?) -> Bool{
            if let min = min, root.val <= min {
                return false
            }
            
            if let max = max, root.val >= max {
                return false
            }
            
            let a = (root.left != nil) ? _isValidBST(root.left!, min, root.val) : true
            let b = (root.right != nil) ? _isValidBST(root.right!, root.val, max) : true
    
            return a && b
        }
        return _isValidBST(root, nil, nil)
    }
    
}
