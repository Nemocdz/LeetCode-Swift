import Cocoa

/*
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
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

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
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
        
        return answers.reversed()
    }
}

Solution().levelOrderBottom(root)
