import Cocoa

/*
Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue = [(root, 0)]
        var result = [Int]()
        while !queue.isEmpty {
            let (node, height) = queue.removeFirst()
            if result.count <= height {
                result.append(node.val)
            }
            if let right = node.right {
                queue.append((right, height + 1))
            }
            
            if let left = node.left {
                queue.append((left, height + 1))
            }
        }
        return result
    }
}
