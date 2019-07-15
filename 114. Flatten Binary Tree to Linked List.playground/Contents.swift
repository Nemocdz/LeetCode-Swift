import Cocoa

/*
 给定一个二叉树，原地将它展开为链表。
 
 例如，给定二叉树
 
     1
    / \
   2   5
  / \   \
 3   4   6
将其展开为：
 
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
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
    func flatten(_ root: TreeNode?) {
        var temp:TreeNode? = nil
        func _flatten(_ root: TreeNode?) {
            guard let root = root else { return }
            _flatten(root.right)
            _flatten(root.left)
            root.right = temp
            root.left = nil
            temp = root
        }
        _flatten(root)
    }
}
