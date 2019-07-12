import Cocoa

/*
 根据一棵树的前序遍历与中序遍历构造二叉树。
 
 注意:
 你可以假设树中没有重复的元素。
 
 例如，给出
 
 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        func _buildTree(_ preorder: inout [Int], _ inorder: [Int]) -> TreeNode? {
            guard !inorder.isEmpty else {
                return nil
            }
            let rootValue = preorder.removeFirst()
            let root = TreeNode(rootValue)
            if let rootIndex = inorder.firstIndex(of: rootValue) {
                let left = Array(inorder[0..<rootIndex])
                let right = Array(inorder[rootIndex + 1..<inorder.count])
                root.left = _buildTree(&preorder, left)
                root.right = _buildTree(&preorder, right)
            }
            return root
        }
        
        var preorder = preorder
        return _buildTree(&preorder, inorder)
    }
}

Solution().buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
