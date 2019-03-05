import Cocoa

/*
 Given inorder and postorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:
 
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
