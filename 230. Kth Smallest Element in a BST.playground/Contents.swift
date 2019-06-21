import Cocoa

/*
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 
 Example 1:
 
 Input: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
 Output: 1
 Example 2:
 
 Input: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
 Output: 3
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func count(of root:TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            return 1 + count(of: root.left) + count(of: root.right)
        }
        
        guard let root = root else {
            return -1
        }
        
        let leftCount = count(of: root.left)
        if k <= leftCount {
            return kthSmallest(root.left, k)
        } else if k > leftCount + 1 {
            return kthSmallest(root.right, k - 1 - leftCount)
        } else {
            return root.val
        }
    }
}
