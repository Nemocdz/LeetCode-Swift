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
        var postorder = postorder
        func _buildTree(_ inorder: [Int]) -> TreeNode? {
            if inorder.isEmpty {
                return nil
            }
            
            let rootValue = postorder.removeLast()
            let root = TreeNode(rootValue)
            
            let leftLength = inorder.firstIndex(of: rootValue)!

            root.right = _buildTree(Array(inorder[(leftLength + 1)...]))
            root.left = _buildTree(Array(inorder[0..<leftLength]))
            return root
        }
        return _buildTree(inorder)
    }
}
