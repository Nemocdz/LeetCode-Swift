import Cocoa

/*
 给定一个二叉树，返回它的中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,3,2]
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var answers = [Int]()
        func _inorderTraversal(_ root: TreeNode) {
            if let left = root.left {
                _inorderTraversal(left)
            }
            answers.append(root.val)
            if let right = root.right {
                _inorderTraversal(right)
            }
        }
        
        if let root = root {
            _inorderTraversal(root)
        }
        return answers
    }
}
