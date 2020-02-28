import Cocoa

/*
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 
 示例:
 
 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:
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
        if root == nil {
            return []
        }
        
        var queue = [(root!, 0)]
        var answers = [Int]()
        while !queue.isEmpty {
            let (node, height) = queue.removeFirst()
            if answers.count <= height {
                answers.append(node.val)
            }
            if let right = node.right {
                queue.append((right, height + 1))
            }
            
            if let left = node.left {
                queue.append((left, height + 1))
            }
        }
        return answers
    }
}
