import Cocoa

/*
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 返回锯齿形层次遍历如下：
 
 [
 [3],
 [20,9],
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
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
        
        return answers.enumerated().map{ $0.offset % 2 == 1 ? $0.element.reversed() : $0.element }
    }
}
