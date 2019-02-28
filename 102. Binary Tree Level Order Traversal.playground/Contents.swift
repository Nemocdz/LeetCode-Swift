import Cocoa

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
        var maxDeep = 0
        while !queue.isEmpty {
            let (deep, node) = queue.removeFirst()
            var array = result[deep]
            array.append(node.val)
            result[deep] = array
            
            if let left = node.left {
                if deep + 1 > maxDeep {
                    result.append([Int]())
                    maxDeep = deep + 1
                }
                queue.append((deep + 1, left))
            }
            
            if let right = node.right {
                if deep + 1 > maxDeep {
                    result.append([Int]())
                    maxDeep = deep + 1
                }
                queue.append((deep + 1, right))
            }
        }
        return result
    }
}


