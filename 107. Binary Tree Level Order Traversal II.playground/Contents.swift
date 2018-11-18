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

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var dic = [Int:[Int]]()
        var result = [[Int]]()
        addValToDic(root, dic: &dic, currentHeight: 0)
        
        if dic.count == 1{
            result.append([root!.val])
        } else if dic.count > 1 {
            for index in 0...dic.count - 1{
                result.append(dic[dic.count - 1 - index]!)
            }
        }
        return result
    }
    
    func addValToDic(_ root:TreeNode?, dic:inout [Int:[Int]], currentHeight: Int) {
        guard let root = root else {
            return
        }
        
        if dic[currentHeight] == nil {
            dic[currentHeight] = [Int]()
        }
        
        dic[currentHeight]!.append(root.val)
        
        addValToDic(root.left, dic: &dic, currentHeight: currentHeight + 1)
        addValToDic(root.right, dic: &dic, currentHeight: currentHeight + 1)
    }
}

Solution().levelOrderBottom(root)
