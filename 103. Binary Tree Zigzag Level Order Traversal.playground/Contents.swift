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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
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
        return result.enumerated().map({ $0.offset % 2 == 0 ? $0.element : $0.element.reversed() })
    }
}
