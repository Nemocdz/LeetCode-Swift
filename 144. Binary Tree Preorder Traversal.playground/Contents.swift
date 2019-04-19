import Cocoa

/*
Given a binary tree, return the preorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
1
 \
  2
 /
3

Output: [1,2,3]
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
