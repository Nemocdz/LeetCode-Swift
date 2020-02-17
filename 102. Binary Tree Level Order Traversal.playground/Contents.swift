import Cocoa

/*
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
   3
  / \
  9  20
    /  \
   15   7
 返回其层次遍历结果：
 
 [
 [3],
 [9,20],
 [15,7]
 ]
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [root!]
        var answers = [[Int]]()
        
        // 当前层剩余
        var cur = 1
        // 下层应有
        var next = 0
        var temp = [Int]()
        while !queue.isEmpty {
            let first = queue.removeFirst()
            temp.append(first.val)
            
            if let left = first.left {
                queue.append(left)
                next += 1
            }
            
            if let right = first.right {
                queue.append(right)
                next += 1
            }
            
            cur -= 1
            
            if cur == 0 {
                answers.append(temp)
                temp.removeAll()
                cur = next
                next = 0
            }
        }
        
        return answers
    }
}


