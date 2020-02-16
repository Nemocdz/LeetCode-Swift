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
        if preorder.count != inorder.count || preorder.isEmpty {
            return nil
        }
        
        let rootValue = preorder.first!
        let root = TreeNode(rootValue)
        
        let leftLength = inorder.firstIndex(of: rootValue)!
        
        root.left = buildTree(Array(preorder[1..<(1 + leftLength)]), Array(inorder[0..<leftLength]))
        root.right = buildTree(Array(preorder[(1 + leftLength)...]), Array(inorder[(leftLength + 1)...]))
        return root
    }
}

Solution().buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
