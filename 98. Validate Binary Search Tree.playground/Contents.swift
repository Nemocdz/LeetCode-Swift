import Cocoa

/*
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 
 假设一个二叉搜索树具有如下特征：
 
 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:
 
 输入:
   2
  / \
 1   3
 输出: true
 示例 2:
 
 输入:
   5
  / \
 1   4
    / \
   3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
           根节点的值为 5 ，但是其右子节点值为 4 。
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
