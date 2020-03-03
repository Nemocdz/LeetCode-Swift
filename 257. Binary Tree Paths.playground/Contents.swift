import Cocoa

/*
 给定一个二叉树，返回所有从根节点到叶子节点的路径。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 输入:
 
    1
  /   \
 2     3
  \
   5
 
 输出: ["1->2->5", "1->3"]
 
 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3
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
 
class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var answers = [String]()
        
        func _binaryTreePaths(_ root:TreeNode?, _ path:String) {
            if root == nil {
                return
            }
            
            let path = path + "\(root!.val)"
            
            if root?.left == nil && root?.right == nil {
                answers.append(path)
            } else {
                _binaryTreePaths(root?.left, "\(path)->")
                _binaryTreePaths(root?.right, "\(path)->")
            }
        }
        
        _binaryTreePaths(root, "")
        return answers
    }
}
