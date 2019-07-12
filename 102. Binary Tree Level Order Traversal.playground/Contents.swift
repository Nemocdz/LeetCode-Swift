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
        guard let root = root else {
            return []
        }
        var queue = [(Int, TreeNode)]()
        queue.append((0, root))
        var result = [[Int]()]
        while !queue.isEmpty {
            let (deep, node) = queue.removeFirst()
            if result.count <= deep {
                result.append([Int]())
            }
            
            var array = result[deep]
            array.append(node.val)
            result[deep] = array
            
            let nextDeep = deep + 1
            if let left = node.left {
                queue.append((nextDeep, left))
            }
            
            if let right = node.right {
                queue.append((nextDeep, right))
            }
        }
        return result
    }
}


