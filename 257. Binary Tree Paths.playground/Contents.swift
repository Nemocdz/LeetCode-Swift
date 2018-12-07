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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        func updateTreePath(_ root:TreeNode?, currentPath:String){
            guard let root = root else {
                return
            }
            
            if root.left == nil && root.right == nil {
                result.append(currentPath + "\(root.val)")
            } else {
                let nextPath =  currentPath + "\(root.val)->"
                updateTreePath(root.left, currentPath: nextPath)
                updateTreePath(root.right, currentPath: nextPath)
            }
        }
        updateTreePath(root, currentPath: "")
        return result
    }
}
