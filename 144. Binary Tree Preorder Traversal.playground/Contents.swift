import Cocoa

/*
 给定一个二叉树，返回它的 前序 遍历。
 
   示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func _preorderTraversal(_ root: TreeNode?) {
            guard let root = root else { return }
            result.append(root.val)
            _preorderTraversal(root.left)
            _preorderTraversal(root.right)
        }
        _preorderTraversal(root)
        return result
    }
}
