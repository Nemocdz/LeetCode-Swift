import Cocoa

/*
 根据一棵树的中序遍历与后序遍历构造二叉树。
 
 注意:
 你可以假设树中没有重复的元素。
 
 例如，给出
 
 中序遍历 inorder = [9,3,15,20,7]
 后序遍历 postorder = [9,15,7,20,3]
 返回如下的二叉树：
 
   3
  / \
 9  20
   /  \
  15   7
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        func _buildTree(_ postorder: inout [Int], _ inorder: [Int]) -> TreeNode? {
            guard !inorder.isEmpty else {
                return nil
            }
            let rootValue = postorder.removeLast()
            let root = TreeNode(rootValue)
            if let rootIndex = inorder.firstIndex(of: rootValue) {
                let left = Array(inorder[0..<rootIndex])
                let right = Array(inorder[rootIndex + 1..<inorder.count])
                root.right = _buildTree(&postorder, right)
                root.left = _buildTree(&postorder, left)
            }
            return root
        }
        
        var postorder = postorder
        return _buildTree(&postorder, inorder)
    }
}
