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
