import Cocoa

/*
 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
 
     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:
 
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
